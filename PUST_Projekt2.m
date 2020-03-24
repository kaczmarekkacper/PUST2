%% 0. Definicje makr 

clear;
close all;
more off;

global Upp;
global Ypp;
global Zpp;

global T;
global k; %iloœæ próbek symulacji

Upp = 0;
Ypp = 0;
Zpp = 0;

T = 0.5;
k = 250;

figures = 1; % czy wyœwietlaæ wykresy
saving = 1; % czy zapisywaæ dane

%% 1. Sprawdzic poprawnosc podanego punku pracy.
mkdir('results/1');

y = zeros(k, 1); %alokacja wektora o d³ugoœci symulacji
u = zeros(k, 1); %Sterowanie sta³e równe punktow pracy
z = zeros(k, 1);
for i = 12:k
    y(i) = symulacja_obiektu7y(Upp,Upp, Zpp, Zpp, y(i-1),y(i-2));
end

%rysowanie wykresów
if figures
    plotProcess(u, y,'Sprawdzenie punktu pracy');
end

if saving
    matlab2tikz('results/1/CheckWorkpoint.tex');
end


%% 2. Wyznaczyc symulacyjnie odpowiedzi skokowe torów wejscie-wyjscie i zak³ócenie-wyjscie
%     procesu dla kilku zmian sygna³u sterujacego. Narysowac te odpowiedzi, oddzielnie dla
%     obydwu torów. Narysowac charakterystyke statyczna procesu y(u, z). Czy w³asciwosci
%     statyczne i dynamiczne procesu sa (w przyblizeniu) liniowe? Jezeli tak, okreslic
%     wzmocnienie statyczne obu torów procesu.

mkdir('results/2');



%% 3. Wyznaczyc odpowiedzi skokowe obu torów wykorzystywane w algorytmie DMC, tzn.
%     zestaw liczb s1, s2, . . . oraz sz1, sz2, . . . (przy skoku jednostkowym, odpowiednio sygna³u
%     sterujacego i zak³ócajacego: od chwili k = 0 w³acznie sygna³ wymuszenia ma wartosc 1,
%     w przesz³osci jest zerowy). Zamiescic rysunki odpowiedzi skokowych obu torów.
mkdir('results/3');

%% 4. Napisac program w jezyku MATLAB do symulacji algorytm DMC w najprostszej 
%     wersji analitycznej. Dobrac parametry D, N, Nu,  algorytmu DMC przy skokowej
%     zmianie sygna³u wartosci zadanej z 0 do 1 i zerowym zak³óceniu. Jakosc regulacji
%     oceniac jakosciowo (na podstawie rysunków przebiegów sygna³ów) oraz ilosciowo, wyznaczajac
%     wskaznik jakosci regulacji
%     E = (yzad(k) ? y(k))2
%     Zamiescic wybrane wyniki symulacji (przebiegi sygna³ów wejsciowych i
%     wyjsciowych procesu oraz wartosci wskaznika E).
mkdir('results/4');


%% 5. Za³ozyc, ze oprócz zmian sygna³u wartosci zadanej nastepuje skokowa zmiana sygna³u
%     zak³ócenia z wartosci 0 do 1 (zmiana ta ma miejsce po osiagnieciu przez proces wartosci
%     zadanej wyjscia). Dobrac parametr Dz. Zamiescic wybrane wyniki symulacji. Pokazac,
%     ze pomiar zak³ócenia i jego uwzglednienie prowadzi do lepszej regulacji niz gdy brak
%     jest tego pomiaru.
mkdir('results/5');


%% 6. Sprawdzic dzia³anie algorytmu przy zak³óceniu zmiennym sinusoidalnie. Zamiescic wybrane
%     wyniki symulacji przy uwzglednieniu i nie uwzglednieniu mierzonego zak³ócenia w algorytmie.
mkdir('results/6');


%% 7. Dla dobranych parametrów algorytmu zbadac jego odpornosc przy b³edach pomiaru
%     sygna³u zak³ócenia (szum pomiarowy). Rozwazyc kilka wartosci b³edów. Zamiescic
%     wybrane wyniki symulacji.
mkdir('results/7');

