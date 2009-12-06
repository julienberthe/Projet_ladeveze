%%prise en compte des CL par substitution

function [toto,toto1]=Substitution_flexion(mat,donnee)
    mat.K_ef_flex(:,1)=[];
    mat.K_ef_flex(:,2)=[];
    mat.K_ef_flex(1,:)=[];
    mat.K_ef_flex(2,:)=[];
    donnee.x(1)=[];
    
    toto=mat;
    toto1=donnee;