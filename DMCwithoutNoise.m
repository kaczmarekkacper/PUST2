function [u, y] = DMCwithoutNoise(D, Dz, N, Nu, lambda, yzad, sim_time, u_prev, y_prev, z)

% Definicja sta�ych
global s;
global sz; 
%alokacja wektor�w
y = ones(1,sim_time)*y_prev;
u = ones(1,sim_time)*u_prev;
% z to wektor zak��cenia
%Obiekt DMC
dmc = DMCRegWithNoise(s, sz, D, Dz, N, Nu, lambda);
dmc.reset(u_prev, z(1));
   % dmc = DMCReg(s,D,N,Nu,lambda,10000,-10000000,1000000); 
    %dmc.reset(u_prev);
dmc.setValue(yzad);

%Symulacja
for i=1:sim_time
    if i > 5
        y(i) = symulacja_obiektu7y(u(i-4),u(i-5), z(i-1), z(i-2),y(i-1),y(i-2));
    end
        u(i) = dmc.countWithoutNoise(y(i));
end

end

