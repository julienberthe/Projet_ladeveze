function toto=Construction_EF_traction(donnee);


%calcul de la matrice de rigidite
	K_elem=[1 -1;-1 1];			%matrice elementaire
	toto.K_ef=zeros(size(donnee.Elem,2)+1);		%initialisation de la matrice de rigidite globale

	%assemblage
	for j=1:size(donnee.Elem,2) %ici on fait une boucle sur tous les elements
        %donnee.Elem{j}.young*donnee.Elem{j}.S/donnee.Elem{j}.dx
		toto.K_ef(j:j+1,j:j+1)=toto.K_ef(j:j+1,j:j+1)+	(donnee.Elem{j}.young*donnee.Elem{j}.S/donnee.Elem{j}.dx)*K_elem;
	end


