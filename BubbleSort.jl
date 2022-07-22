using Base.Threads
using BenchmarkTools
function odd_phase(x)
    n=length(x)
    for i=1:n
         for j=1:n-i
            if x[j]>x[j+1]
                temp=x[j]
                x[j]=x[j+1]
                x[j+1]=temp
            end
        end
        i=i+2
    end
end
function even_phase(x)
    n=length(x)
    for i=1:n
         for j=2:n-i
            if x[j]>x[j+1]
                temp=x[j]
                x[j]=x[j+1]
                x[j+1]=temp
            end
        end
        i=i+2
    end
end

function BubbleSort(x)
    n=length(x)
    @threads for i=1:n
        if i%2==0
            odd_phase(x)
        else
            even_phase(x)
        end
    end
return x  
end

