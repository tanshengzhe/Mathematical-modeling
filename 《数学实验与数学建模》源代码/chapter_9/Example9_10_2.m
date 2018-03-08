s1=0; s2=0; s3=0;s4=0;
     x=rand(10000,1);
     for i=1:10000
          if x(i)<0.3
             s1=s1+1;
          elseif x(i)<0.7
             s2=s2+1;
          else
              if x(i)<0.9
                 s3=s3+1;
              else 
                 s4=s4+1;
              end
          end
end
[s1/10000, s2/10000,s3/10000,s4/10000]
