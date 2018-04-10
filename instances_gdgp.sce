clear

n=8 //NUMBER OF ATOMS
m = 10//NUMBER OF INSTANCES
for repete = 1:m
    dd(1,2)=1
    dd(2,3)=1
    
    y0=[0
    0
    0
    1]
    
    for i=1:n
        for j=i:n
            
            fator=rand()

            if fator <= 0.33 then
                ang=%pi/3
            end
            if fator > 0.33 then
                if fator <= 0.66 then
                ang=%pi
            end
             end
            if fator > 0.66 then
                if fator <= 1 then
                ang=5*%pi/3
             end
             end
             w(i,j)=ang
             w(j,i)=ang
    fator2=rand()
            tt(i,j)=2.0+fator2/2
            tt(j,i)=2.0+fator2/2
    
            if i>3 then
                dd(i-1,i)=1.0
                tt(i-2,i)=2+fator2/2
                dd(i,i-1)=1.0
                tt(i,i-2)=2

                   end
    end 
    end
    
    B1=[1 0 0 0
    0 1 0 0
    0 0 1 0
    0 0 0 1]
    
    B2=[-1 0 0 -dd(1,2)
    0 1 0 0
    0 0 -1 0
    0 0 0 1]
    
    B3=[-cos(tt(1,3)) -sin(tt(1,3)) 0 -dd(2,3)*cos(tt(1,3))
     sin(tt(1,3)) -cos(tt(1,3)) 0 dd(2,3)*sin(tt(1,3))
    0 0 1 0
    0 0 0 1]
    
    
     
    x(1,1)=0
    x(1,2)=0
    x(1,3)=0
     
    x(2,1)=-dd(1,2)
    x(2,2)=0
    x(2,3)=0
     
    x(3,1)=-dd(1,2) +dd(2,3)*cos(tt(1,3))
    x(3,2)=dd(2,3)*sin(tt(1,3))
    x(3,3)=0
    
    BB=B1*B2*B3
    
    for i=4:n
        Bi=[-cos(tt(i-2,i)) -sin(tt(i-2,i)) 0 -dd(i-1,i)*cos(tt(i-2,i))
        sin(tt(i-2,i))*cos(w(i-3,i)) -cos(tt(i-2,i))*cos(w(i-3,i)) -sin(w(i-3,i)) dd(i-1,i)*sin(tt(i-2,i))*cos(w(i-3,i))
        sin(tt(i-2,i))*sin(w(i-3,i)) -cos(tt(i-2,i))*sin(w(i-3,i)) cos(w(i-3,i)) dd(i-1,i)*sin(tt(i-2,i))*sin(w(i-3,i))
        0 0 0 1]
        
        BB=BB*Bi
        y=BB*y0
        
        for j=1:3
            x(i,j)=y(j)
        end
    end
    
    radii1=0.15;
    radii2=0.3;
    for i=1:n
        for j=i:n
            aux=0
            for k=1:3
                aux=aux+(x(i,k)-x(j,k))^2
            end
            d(i,j)=sqrt(aux)
            d(j,i)=d(i,j)
            dui(i,j)=d(i,j)-min(radii2,radii2*d(i,j))
            if j-i<3 then 
                dui(i,j)=d(i,j)-radii1
            end
            dui(j,i)=dui(i,j)
            dui(i,i)=0
            dus(i,j)=d(i,j)+min(radii2,radii2*d(i,j))
          if j-i<3 then 
              dus(i,j)=d(i,j)+radii1
            end
            dus(j,i)=dus(i,j)
            dus(i,i)=0
        end
    end
    
    //
    //----------------------------------------------------------
    //-----------------PRINTING THE INSTANCE-------------------
    //----------------------------------------------------------
    filename = strcat([string(repete),'auto',string(n),'ran.dat']);
    fd = mopen(fullfile('C:\Users\User\Desktop\',filename),'w');
    mfprintf(fd,'param n=%d;\n',n);
    mfprintf(fd,'param y:');
    for i=1:3
        mfprintf(fd,' %d',i);
    end
    mfprintf(fd,' :=\n');
    for i=1:3
        mfprintf(fd,'%d ',i);
        for j=1:3
            if j<3 then
                mfprintf(fd,'%f ',x(i,j));            
            else
                mfprintf(fd,'%f',x(i,j));            
            end
        end
        if i<3 then
            mfprintf(fd,'\n');            
        else
            mfprintf(fd,';\n');            
        end
    end
    
    mfprintf(fd,'param di:');
    for i=1:n
        mfprintf(fd,' %d',i);
    end
    mfprintf(fd,' :=\n');
    for i=1:n
        mfprintf(fd,'%d ',i);
        for j=1:n
            if j<n then
                mfprintf(fd,'%f ',dui(i,j));
            else
                mfprintf(fd,'%f',dui(i,j));
            end
        end
        if i<n then
            mfprintf(fd,'\n');            
        else
            mfprintf(fd,';\n');            
        end
    end
    mfprintf(fd,'param ds:');
    for i=1:n
        mfprintf(fd,' %d',i);
    end
    mfprintf(fd,' :=\n');
    for i=1:n
        mfprintf(fd,'%d ',i);
        for j=1:n
            if j<n then
                mfprintf(fd,'%f ',dus(i,j));
            else
                mfprintf(fd,'%f',dus(i,j));
            end
        end
        if i<n then
            mfprintf(fd,'\n');            
        else
            mfprintf(fd,';\n');            
        end
    end
    mclose(fd);
end
//----------------------------------------------------------

