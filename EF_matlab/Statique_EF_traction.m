%détermination du déplacement "statique"
function toto=Statique_EF_traction(matrice,donnee);

 toto.Us=matrice.K_ef^-1*matrice.F';
%toto.Us=matrice.Ks\matrice.Fs';
toto.Ug=toto.Us';
toto.dep(1:size(donnee.Elem,2)+1)=0;

for j=2:(size(donnee.Elem,2)+1)
    toto.dep(j)=toto.Ug(j-1);
end
end