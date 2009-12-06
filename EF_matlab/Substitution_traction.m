%%prise en compte des CL par substitution
function [toto,toto1]=Substitution_traction(mat,donnee)
    mat.K_ef(:,1)=[];
    mat.K_ef(1,:)=[];
    donnee.x(1)=[];
    
    toto=mat;
    toto1=donnee;