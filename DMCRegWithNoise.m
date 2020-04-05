classdef DMCRegWithNoise < handle
    properties
        s
        sz
        D
        Dz
        N
        Nu
        LAMBDA
        psi
        M
        Mp
        Mpz
        K
        yzad
        u_prev
        z_prev
        deltaup
        deltazp
    end
    
    methods
        function obj = DMCRegWithNoise(s, sz, D, Dz, N, Nu, lambda)
            obj.s = s;
            obj.sz = sz;
            obj.D = D;
            obj.Dz = Dz;
            obj.N = N;
            obj.Nu = Nu;
            obj.LAMBDA = eye(Nu)*lambda;
            obj.psi = eye(N);

            % Wyznaczanie macierzy M
            obj.M = zeros(N, Nu);
            for i=1:1:Nu
                obj.M(i:N,i)=s(1:N-i+1)';
            end


            % Wyznaczanie macierzy Mp
            obj.Mp= zeros(N, D-1);
            for i=1:N
               for j=1:D-1
                  if i+j<=D
                     obj.Mp(i,j)=s(i+j)-s(j);
                  else
                     obj.Mp(i,j)=s(D)-s(j);
                  end   
               end
            end
            
            obj.Mpz= zeros(N, obj.Dz-1);
            obj.Mpz(:,1) = sz(1:N);
            for i=1:N
               for j=1:obj.Dz-1
                  if i+j<=obj.Dz
                     obj.Mpz(i,j+1)=sz(i+j)-sz(j);
                  else
                     obj.Mpz(i,j+1)=sz(obj.Dz)-sz(j);
                  end   
               end
            end

            % Wektor wzmocnieñ - wyznaczany raz (offline)
            obj.K=(obj.M'*obj.psi*obj.M+obj.LAMBDA)^(-1)*obj.M'*obj.psi;
        end
        
        function [] = reset(obj, u_p, z_p)
            obj.u_prev = u_p;
            obj.z_prev = z_p;
            obj.deltaup=zeros(1,obj.D-1)';
            obj.deltazp=zeros(1,obj.Dz)';
        end
        
        function [] = setValue(obj, yzad)
            yzad(1:obj.N)= yzad;
            obj.yzad=yzad';
        end
        
        function u = countValue(obj,y, z)
            
            % aktualizacja wektora aktualnej wartoœci wyjœcia
            yk=ones(obj.N,1)*y;

            % wyliczenie nowego wektora odpowiedzi swobodnej
            y0=yk+obj.Mp*obj.deltaup+obj.Mpz*obj.deltazp;

            % wyliczenie wektora zmian sterowania
            deltauk=obj.K*(obj.yzad-y0);

            % prawo regulacji
            u=obj.u_prev+deltauk(1);
            obj.u_prev = u;
            deltazk = z - obj.z_prev;
            obj.z_prev = z;
        
            % aktualizacja poprzednich zmian sterowania
            obj.deltaup=[deltauk(1) obj.deltaup(1:end-1)']';
            obj.deltazp=[deltazk obj.deltazp(1:end-1)']';
        end
        function u = countWithoutNoise(obj,y)
            % aktualizacja wektora aktualnej wartoœci wyjœcia
            yk=ones(obj.N,1)*y;

            % wyliczenie nowego wektora odpowiedzi swobodnej
            y0=yk+obj.Mp*obj.deltaup;

            % wyliczenie wektora zmian sterowania
            deltauk=obj.K*(obj.yzad-y0);

            % prawo regulacji
            u=obj.u_prev+deltauk(1);
            obj.u_prev = u;

            % aktualizacja poprzednich zmian sterowania
            obj.deltaup=[deltauk(1) obj.deltaup(1:end-1)']';
        end
    end
end