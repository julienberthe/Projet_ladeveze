%------------------------------------------------%
%                                                %
% Poutre et erreur en relation de comportement   %
%                                                %
%------------------------------------------------%

clear all;close all;clc;

% Valeurs cibles

    % Flexion
    
    vl=0.1;
    Tl=10000;
    
    % Compression
    
    ul= 0.1;
    Fl=10000;

% variable a determiner

a = 0.9;
pos = 0.5;
l=0.1;

% parametres du materiau sain
	donnee.mat1.L=1-l;			%longueur:
	donnee.mat1.S=10^(-4);		%section:
	donnee.mat1.E=220*10^9;		%module de young
	donnee.mat1.rho=7000;		%masse volumique
	donnee.mat1.alpha=0;		%coefficient d'amortissement C=alpha*K+beta*M
	donnee.mat1.beta=0;
    donnee.mat1.I=1;
    
% parametres du materiau endommage
	donnee.mat2.L=l;			%longueur:
	donnee.mat2.S=10^(-4);		%section:
	donnee.mat2.E=a*220*10^9;   %module de young
	donnee.mat2.rho=7000;		%masse volumique
	donnee.mat2.alpha=0;		%coefficient d'amortissement C=alpha*K+beta*M
	donnee.mat2.beta=0;
    donnee.mat2.I=1;
    
% Nombres d'éléments sur la poutre

    donnee.nelem=200;
    
    
%mise en donnee

	for i=1:donnee.nelem
		donnee.Elem{i}.xinit=(i-1)*donnee.mat1.L/donnee.nelem;
		donnee.Elem{i}.xfinal=i*donnee.mat1.L/donnee.nelem;
		donnee.Elem{i}.dx=donnee.mat1.L/donnee.nelem;
		donnee.Elem{i}.S=donnee.mat1.S;
        donnee.Elem{i}.I=donnee.mat1.I;
		donnee.Elem{i}.young=donnee.mat1.E;
		donnee.Elem{i}.rho=donnee.mat1.rho;
	end

	donnee.dx =donnee.mat1.L/donnee.nelem;
	donnee.x  =[0:donnee.dx:donnee.mat1.L];
    donnee.f = donnee.mat1.E*donnee.mat1.S;


	%construction des differentes matrice du probleme EF
    disp('I	Construction des matrices');
    matrice_flexion=Construction_EF_flexion(donnee);

    %Prise en comtpe des CL (methode de substitution)
    disp('Ib   Conditionnement des matrices par subsitution')
    [matrice_flexS,donneeS]=Substitution_flexion(matrice_flexion,donnee);
    
    %Construction du chargement
    
    %Valeur de l'effort en bout de poutre
    
    F=10000;
    
    % Construction du vecteur effort
    
    matrice_flexS.F(1:2*(size(donnee.Elem,2)))=0;
    matrice_flexS.F(2*(size(donnee.Elem,2))-1)=F;
    
    % Résolution du probleme
    
    Solution=Statique_EF_flexion(matrice_flexS,donneeS);
    
    

    
    