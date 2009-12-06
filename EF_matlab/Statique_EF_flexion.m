%détermination du déplacement "statique"
function toto=Statique_EF_flexion(matrice,donnee);

 toto.Us=matrice.K_ef_flex^-1*matrice.F';
%toto.Us=matrice.Ks\matrice.Fs';
toto.Ug=toto.Us';
toto.dep(1:size(donnee.Elem,2)+1)=0;
toto.rot(1:size(donnee.Elem,2)+1)=0;

for j=2:(size(donnee.Elem,2)+1)
    toto.dep(j)=toto.Ug(2*(j-1)-1);
    toto.rot(j)=toto.Ug(2*(j-1));
end
end