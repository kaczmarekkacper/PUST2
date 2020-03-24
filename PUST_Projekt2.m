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
    plotProcess(u, y,'Sprawdzenie punktu pracy');
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



%% 3. Wyznaczyc odpowiedzi skokowe obu tor�w wykorzystywane w algorytmie DMC, tzn.
%     zestaw liczb s1, s2, . . . oraz sz1, sz2, . . . (przy skoku jednostkowym, odpowiednio sygna�u
%     sterujacego i zak��cajacego: od chwili k = 0 w�acznie sygna� wymuszenia ma wartosc 1,
%     w przesz�osci jest zerowy). Zamiescic rysunki odpowiedzi skokowych obu tor�w.
mkdir('results/3');

%% 4. Napisac program w jezyku MATLAB do symulacji algorytm DMC w najprostszej 
%     wersji analitycznej. Dobrac parametry D, N, Nu,  algorytmu DMC przy skokowej
%     zmianie sygna�u wartosci zadanej z 0 do 1 i zerowym zak��ceniu. Jakosc regulacji
%     oceniac jakosciowo (na podstawie rysunk�w przebieg�w sygna��w) oraz ilosciowo, wyznaczajac
%     wskaznik jakosci regulacji
%     E = (yzad(k) ? y(k))2
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

