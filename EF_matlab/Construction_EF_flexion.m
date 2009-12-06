function toto=Construction_EF_flexion(donnee);


%calcul de la matrice de rigidite
	
	toto.K_ef_flex=zeros(2*(size(donnee.Elem,2)+1));		%initialisation de la matrice de rigidite globale

	%assemblage
	for j=1:size(donnee.Elem,2) %ici on fait une boucle sur tous les elements
        % Calcul de la matrice elementaire de l'element
        K_elem_flex=[(12) (6*donnee.Elem{j}.dx) (-12) (6*donnee.Elem{j}.dx); (6*donnee.Elem{j}.dx) (4*(donnee.Elem{j}.dx^(2))) (-6*donnee.Elem{j}.dx) (2*(donnee.Elem{j}.dx^(2))); (-12) (-6*donnee.Elem{j}.dx) (12) (-6*donnee.Elem{j}.dx); (6*donnee.Elem{j}.dx) (2*(donnee.Elem{j}.dx^(2))) (-6*donnee.Elem{j}.dx) (4*(donnee.Elem{j}.dx^(2)))];			%matrice elementaire
        % Assemblage dans la matrice globale
		toto.K_ef_flex((2*j-1):(2*j-1)+3,(2*j-1):(2*j-1)+3)=toto.K_ef_flex((2*j-1):(2*j-1)+3,(2*j-1):(2*j-1)+3)+	(donnee.Elem{j}.young*donnee.Elem{j}.I/donnee.Elem{j}.dx^(3))*K_elem_flex;
    end

end