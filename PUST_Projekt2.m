%% 0. Definicje makr 

clear;
close all;
more off;

global Upp;
global Ypp;
global Zpp;

global T;
global k; %ilo�� pr�bek symulacji

Upp = 0;
Ypp = 0;
Zpp = 0;

T = 0.5;
k = 250;

figures = 1; % czy wy�wietla� wykresy
saving = 1; % czy zapisywa� dane

%% 1. Sprawdzic poprawnosc podanego punku pracy.
mkdir('results/1');

y = zeros(k, 1); %alokacja wektora o d�ugo�ci symulacji
u = zeros(k, 1); %Sterowanie sta�e r�wne punktow pracy
z = zeros(k, 1);
for i = 12:k
    y(i) = symulacja_obiektu7y(Upp,Upp, Zpp, Zpp, y(i-1),y(i-2));
end

%rysowanie wykres�w
if figures
    plotProcess(u, y, z, 'Sprawdzenie punktu pracy');
end

if saving
    matlab2tikz('results/1/CheckWorkpoint.tex');
end


%% 2. Wyznaczyc symulacyjnie odpowiedzi skokowe tor�w wejscie-wyjscie i zak��cenie-wyjscie
%     procesu dla kilku zmian sygna�u sterujacego. Narysowac te odpowiedzi, oddzielnie dla
%     obydwu tor�w. Narysowac charakterystyke statyczna procesu y(u, z). Czy w�asciwosci
%     statyczne i dynamiczne procesu sa (w przyblizeniu) liniowe? Jezeli tak, okreslic
%     wzmocnienie statyczne obu tor�w procesu.
mkdir('results/2');
%% skoki sterowania

%Skok u z 0.0 na 0.3 w chwili 10
y = ones(k,1)*Ypp; %alokacja wektora o d�ugo�ci symulacji
u = ones(k,1)*Upp; %Sterowanie sta�e r�wne punktow pracy
z = ones(k,1)*Zpp; 
u(10:k) = 0.3;
for i = 6:k
    y(i) = symulacja_obiektu7y(u(i-4),u(i-5), z(i-1), z(i-2), y(i-1),y(i-2));
end

if figures
    figure;
    subplot(2, 1, 1);
    stairs(1:k, y);
    title('Odpowiedzi skokowe sterowania');
    xlabel('k');
    ylabel('y');
    hold on;
    subplot(2, 1, 2);
    stairs(1:k, u);
    xlabel('k');
    ylabel('u');
    hold on;
end

%Skok u z 0.0 na 1 w chwili 10
y = ones(k,1)*Ypp; %alokacja wektora o d�ugo�ci symulacji
u = ones(k,1)*Upp; %Sterowanie sta�e r�wne punktow pracy
z = ones(k,1)*Zpp; 
u(10:k) = 1;
for i = 6:k
    y(i) = symulacja_obiektu7y(u(i-4),u(i-5), z(i-1), z(i-2), y(i-1),y(i-2));
end

if figures
    subplot(2, 1, 1);
    stairs(1:k, y);
    title('Odpowiedzi skokowe sterowania');
    xlabel('k');
    ylabel('y');
    hold on;
    subplot(2, 1, 2);
    stairs(1:k, u);
    xlabel('k');
    ylabel('u');
    hold on;
end

%Skok u z 0.0 na 2 w chwili 10
y = ones(k,1)*Ypp; %alokacja wektora o d�ugo�ci symulacji
u = ones(k,1)*Upp; %Sterowanie sta�e r�wne punktow pracy
z = ones(k,1)*Zpp; 
u(10:k) = 2;
for i = 6:k
    y(i) = symulacja_obiektu7y(u(i-4),u(i-5), z(i-1), z(i-2), y(i-1),y(i-2));
end

if figures
    subplot(2, 1, 1);
    stairs(1:k, y);
    title('Odpowiedzi skokowe sterowania');
    xlabel('k');
    ylabel('y');
    hold on;
    subplot(2, 1, 2);
    stairs(1:k, u);
    xlabel('k');
    ylabel('u');
    hold on;
end


%Skok u z 0.0 na -0.3 w chwili 10
y = ones(k,1)*Ypp; %alokacja wektora o d�ugo�ci symulacji
u = ones(k,1)*Upp; %Sterowanie sta�e r�wne punktow pracy
z = ones(k,1)*Zpp; 
u(10:k) = -0.3;
for i = 6:k
    y(i) = symulacja_obiektu7y(u(i-4),u(i-5), z(i-1), z(i-2), y(i-1),y(i-2));
end

if figures
    subplot(2, 1, 1);
    stairs(1:k, y);
    title('Odpowiedzi skokowe sterowania');
    xlabel('k');
    ylabel('y');
    hold on;
    subplot(2, 1, 2);
    stairs(1:k, u);
    xlabel('k');
    ylabel('u');
    hold on;
end

%Skok u z 0.0 na -1 w chwili 10
y = ones(k,1)*Ypp; %alokacja wektora o d�ugo�ci symulacji
u = ones(k,1)*Upp; %Sterowanie sta�e r�wne punktow pracy
z = ones(k,1)*Zpp; 
u(10:k) = -1;
for i = 6:k
    y(i) = symulacja_obiektu7y(u(i-4),u(i-5), z(i-1), z(i-2), y(i-1),y(i-2));
end

if figures
    subplot(2, 1, 1);
    stairs(1:k, y);
    title('Odpowiedzi skokowe sterowania');
    xlabel('k');
    ylabel('y');
    hold on;
    subplot(2, 1, 2);
    stairs(1:k, u);
    xlabel('k');
    ylabel('u');
    hold on;
end

%Skok u z 0.0 na -2 w chwili 10
y = ones(k,1)*Ypp; %alokacja wektora o d�ugo�ci symulacji
u = ones(k,1)*Upp; %Sterowanie sta�e r�wne punktow pracy
z = ones(k,1)*Zpp; 
u(10:k) = -2;
for i = 6:k
    y(i) = symulacja_obiektu7y(u(i-4),u(i-5), z(i-1), z(i-2), y(i-1),y(i-2));
end

if figures
    subplot(2, 1, 1);
    stairs(1:k, y);
    title('Odpowiedzi skokowe sterowania');
    xlabel('k');
    ylabel('y');
    legend('0,0 na 0,3', '0,0 na 1', '0,0 na 2', '0,0 na -0,3', '0,0 na -1', '0,0 na -2');
    hold on;
    subplot(2, 1, 2);
    stairs(1:k, u);
    legend('0,0 na 0,3', '0,0 na 1', '0,0 na 2', '0,0 na -0,3', '0,0 na -1', '0,0 na -2');
    xlabel('k');
    ylabel('u');
    hold on;
end
if saving 
    matlab2tikz('results/2/OdpowiedziSkokoweSterowanie.tex');
end

%% odpowiedzi skokowe zak��cenie

%Skok z z 0.0 na 0.3 w chwili 10
y = ones(k,1)*Ypp; %alokacja wektora o d�ugo�ci symulacji
u = ones(k,1)*Upp; %Sterowanie sta�e r�wne punktow pracy
z = ones(k,1)*Zpp; 
z(10:k) = 0.3;
for i = 6:k
    y(i) = symulacja_obiektu7y(u(i-4),u(i-5), z(i-1), z(i-2), y(i-1),y(i-2));
end

if figures
    figure;
    subplot(2, 1, 1);
    stairs(1:k, y);
    title('Odpowiedzi skokowe zak��cenia');
    xlabel('k');
    ylabel('y');
    hold on;
    subplot(2, 1, 2);
    stairs(1:k, z);
    xlabel('k');
    ylabel('z');
    hold on;
end

%Skok z z 0.0 na 1 w chwili 10
y = ones(k,1)*Ypp; %alokacja wektora o d�ugo�ci symulacji
u = ones(k,1)*Upp; %Sterowanie sta�e r�wne punktow pracy
z = ones(k,1)*Zpp; 
z(10:k) = 1;
for i = 6:k
    y(i) = symulacja_obiektu7y(u(i-4),u(i-5), z(i-1), z(i-2), y(i-1),y(i-2));
end

if figures
    subplot(2, 1, 1);
    stairs(1:k, y);
    title('Odpowiedzi skokowe zak��cenia');
    xlabel('k');
    ylabel('y');
    hold on;
    subplot(2, 1, 2);
    stairs(1:k, z);
    xlabel('k');
    ylabel('z');
    hold on;
end

%Skok z z 0.0 na 2 w chwili 10
y = ones(k,1)*Ypp; %alokacja wektora o d�ugo�ci symulacji
u = ones(k,1)*Upp; %Sterowanie sta�e r�wne punktow pracy
z = ones(k,1)*Zpp; 
z(10:k) = 2;
for i = 6:k
    y(i) = symulacja_obiektu7y(u(i-4),u(i-5), z(i-1), z(i-2), y(i-1),y(i-2));
end

if figures
    subplot(2, 1, 1);
    stairs(1:k, y);
    title('Odpowiedzi skokowe zak��cenia');
    xlabel('k');
    ylabel('y');
    hold on;
    subplot(2, 1, 2);
    stairs(1:k, z);
    xlabel('k');
    ylabel('z');
    hold on;
end

%Skok z z 0.0 na -0.3 w chwili 10
y = ones(k,1)*Ypp; %alokacja wektora o d�ugo�ci symulacji
u = ones(k,1)*Upp; %Sterowanie sta�e r�wne punktow pracy
z = ones(k,1)*Zpp; 
z(10:k) = -0.3;
for i = 6:k
    y(i) = symulacja_obiektu7y(u(i-4),u(i-5), z(i-1), z(i-2), y(i-1),y(i-2));
end

if figures
    subplot(2, 1, 1);
    stairs(1:k, y);
    title('Odpowiedzi skokowe zak��cenia');
    xlabel('k');
    ylabel('y');
    hold on;
    subplot(2, 1, 2);
    stairs(1:k, z);
    xlabel('k');
    ylabel('z');
    hold on;
end

%Skok z z 0.0 na -1 w chwili 10
y = ones(k,1)*Ypp; %alokacja wektora o d�ugo�ci symulacji
u = ones(k,1)*Upp; %Sterowanie sta�e r�wne punktow pracy
z = ones(k,1)*Zpp; 
z(10:k) = -1;
for i = 6:k
    y(i) = symulacja_obiektu7y(u(i-4),u(i-5), z(i-1), z(i-2), y(i-1),y(i-2));
end

if figures
    subplot(2, 1, 1);
    stairs(1:k, y);
    title('Odpowiedzi skokowe zak��cenia');
    xlabel('k');
    ylabel('y');
    hold on;
    subplot(2, 1, 2);
    stairs(1:k, z);
    xlabel('k');
    ylabel('z');
    hold on;
end

%Skok z z 0.0 na -2 w chwili 10
y = ones(k,1)*Ypp; %alokacja wektora o d�ugo�ci symulacji
u = ones(k,1)*Upp; %Sterowanie sta�e r�wne punktow pracy
z = ones(k,1)*Zpp; 
z(10:k) = -2;
for i = 6:k
    y(i) = symulacja_obiektu7y(u(i-4),u(i-5), z(i-1), z(i-2), y(i-1),y(i-2));
end

if figures
    subplot(2, 1, 1);
    stairs(1:k, y);
    title('Odpowiedzi skokowe zak��cenia');
    xlabel('k');
    ylabel('y');
    legend('0,0 na 0,3', '0,0 na 1', '0,0 na 2', '0,0 na -0,3', '0,0 na -1', '0,0 na -2');
    hold on;
    subplot(2, 1, 2);
    stairs(1:k, z);
    legend('0,0 na 0,3', '0,0 na 1', '0,0 na 2', '0,0 na -0,3', '0,0 na -1', '0,0 na -2');
    xlabel('k');
    ylabel('z');
    hold on;
end

if saving
    matlab2tikz('results/2/OdpowiedzSkokoweZaklocenia.tex');
end

%% Charakterystyka statyczna

ustat = (-2:0.1:2)';
zstat = -2:0.1:2;
ystat = zeros( size(ustat, 1), size(zstat, 2));


for U = -2:0.1:2
    for Z = -2:0.1:2
        y = ones(k,1)*Ypp; %alokacja wektora o d�ugo�ci symulacji
        u = ones(k,1)*Upp; %Sterowanie sta�e r�wne punktow pracy
        z = ones(k,1)*Zpp;
        u(10:k) = U;
        z(10:k) = Z;
        for i = 6:k
            y(i) = symulacja_obiektu7y(u(i-4),u(i-5), z(i-1), z(i-2), y(i-1),y(i-2));
        end
        ystat( round((U+2)/4*40+1), round((Z+2)/4*40+1)) = y(k); 
    end
end
ustat = ustat * ones(1, size(ustat, 1));
zstat = ones(size(zstat, 2), 1) * zstat ;

if figures
    surface(ustat,zstat,ystat);
    view(3);
    xlabel('u');
    ylabel('z');
    zlabel('y');
    title('Charakterystyka statyczna');
    legend('Charakterystyka statyczna');
end

if saving
    matlab2tikz('results/2/CharakterystykaStatyczna.tex');
end
%% 3. Wyznaczyc odpowiedzi skokowe obu tor�w wykorzystywane w algorytmie DMC, tzn.
%     zestaw liczb s1, s2, . . . oraz sz1, sz2, . . . (przy skoku jednostkowym, odpowiednio sygna�u
%     sterujacego i zak��cajacego: od chwili k = 0 w�acznie sygna� wymuszenia ma wartosc 1,
%     w przesz�osci jest zerowy). Zamiescic rysunki odpowiedzi skokowych obu tor�w.
mkdir('results/3');

%przygotowanie wektor�w
yuDMC = ones(k, 1); %alokacja wektora o d�ugo�ci symulacji
yzDMC = ones(k, 1); %alokacja wektora o d�ugo�ci symulacji
zDMC = ones(k, 1); %alokacja wektora o d�ugo�ci symulacji
uDMC = ones(k,1); %alokacja wektora o d�ugo�ci symulacji


%% model sterownia
y = ones(k,1)*Ypp; %alokacja wektora o d�ugo�ci symulacji
u = ones(k,1)*Upp; %Sterowanie sta�e r�wne punktow pracy
z = ones(k,1)*Zpp;

tau = 10;
u(10:k) = 1;
for i = 6:k
    y(i) = symulacja_obiektu7y(u(i-4),u(i-5), z(i-1), z(i-2), y(i-1),y(i-2));
end

if figures
    figure;
    subplot(2, 1, 1);
    stairs(1:k, y, 'b');
    title('Odpowied� sterowania DMC przed znormalizowaniem');
    xlabel('k');
    ylabel('y');
    legend('Wyj�cie procesu', 'Location', 'south');
    hold on;
    subplot(2, 1, 2);
    stairs(1:k, u, 'm');
    xlabel('k');
    ylabel('u');
    legend('Wej�cie procesu', 'Location', 'south');
    hold on;
end 

if saving
    matlab2tikz('results/3/DMCuPrzed.tex');
end

yuDMC(1:end-tau) = y(tau+1:end); yuDMC(end-tau:end) = y(end-tau:end);
uDMC(1:end-tau) = u(tau+1:end); uDMC(end-tau:end) = u(end-tau:end);

if figures
    figure;
    subplot(2, 1, 1);
    stairs(1:k, yuDMC, 'b');
    title('Odpowied� sterowania DMC po znormalizowaniu');
    xlabel('k');
    ylabel('y');
    legend('Wyj�cie procesu', 'Location', 'south');
    hold on;
    subplot(2, 1, 2);
    stairs(1:k, uDMC, 'm');
    xlabel('k');
    ylabel('u');
    legend('Wej�cie procesu', 'Location', 'south');
    hold on;
end 

if saving
    matlab2tikz('results/3/DMCuPo.tex');
end


%% model zak��cenia

y = ones(k,1)*Ypp; %alokacja wektora o d�ugo�ci symulacji
u = ones(k,1)*Upp; %Sterowanie sta�e r�wne punktow pracy
z = ones(k,1)*Zpp;

tau = 10;
z(10:k) = 1;
for i = 6:k
    y(i) = symulacja_obiektu7y(u(i-4),u(i-5), z(i-1), z(i-2), y(i-1),y(i-2));
end

if figures
    figure;
    subplot(2, 1, 1);
    stairs(1:k, y, 'b');
    title('Odpowied� zak��cenia DMC przed znormalizowaniem');
    xlabel('k');
    ylabel('y');
    legend('Wyj�cie procesu', 'Location', 'south');
    hold on;
    subplot(2, 1, 2);
    stairs(1:k, z, 'c');
    xlabel('k');
    ylabel('z');
    legend('Zak��cenie procesu', 'Location', 'south');
    hold on;
end

if saving
    matlab2tikz('results/3/DMCzPrzed.tex');
end

yzDMC(1:end-tau) = y(tau+1:end); yzDMC(end-tau:end) = y(end-tau:end);
zDMC(1:end-tau) = z(tau+1:end); zDMC(end-tau:end) = z(end-tau:end);

if figures
    figure;
    subplot(2, 1, 1);
    stairs(1:k, yzDMC, 'b');
    title('Odpowied� zak��cenia DMC po znormalizowaniu');
    xlabel('k');
    ylabel('y');
    legend('Wyj�cie procesu', 'Location', 'south');
    hold on;
    subplot(2, 1, 2);
    stairs(1:k, zDMC, 'c');
    xlabel('k');
    ylabel('z');
    legend('Zak��cenie procesu', 'Location', 'south');
    hold on;
end

if saving
    matlab2tikz('results/3/DMCzPo.tex');
end


%% 4. Napisac program w jezyku MATLAB do symulacji algorytm DMC w najprostszej 
%     wersji analitycznej. Dobrac parametry D, N, Nu, lambda algorytmu DMC przy skokowej
%     zmianie sygna�u wartosci zadanej z 0 do 1 i zerowym zak��ceniu. Jakosc regulacji
%     oceniac jakosciowo (na podstawie rysunk�w przebieg�w sygna��w) oraz ilosciowo, wyznaczajac
%     wskaznik jakosci regulacji
%     E = (yzad(k) - y(k))2
%     Zamiescic wybrane wyniki symulacji (przebiegi sygna��w wejsciowych i
%     wyjsciowych procesu oraz wartosci wskaznika E).
mkdir('results/4');


%% 5. Za�ozyc, ze opr�cz zmian sygna�u wartosci zadanej nastepuje skokowa zmiana sygna�u
%     zak��cenia z wartosci 0 do 1 (zmiana ta ma miejsce po osiagnieciu przez proces wartosci
%     zadanej wyjscia). Dobrac parametr Dz. Zamiescic wybrane wyniki symulacji. Pokazac,
%     ze pomiar zak��cenia i jego uwzglednienie prowadzi do lepszej regulacji niz gdy brak
%     jest tego pomiaru.
mkdir('results/5');


%% 6. Sprawdzic dzia�anie algorytmu przy zak��ceniu zmiennym sinusoidalnie. Zamiescic wybrane
%     wyniki symulacji przy uwzglednieniu i nie uwzglednieniu mierzonego zak��cenia w algorytmie.
mkdir('results/6');


%% 7. Dla dobranych parametr�w algorytmu zbadac jego odpornosc przy b�edach pomiaru
%     sygna�u zak��cenia (szum pomiarowy). Rozwazyc kilka wartosci b�ed�w. Zamiescic
%     wybrane wyniki symulacji.
mkdir('results/7');

