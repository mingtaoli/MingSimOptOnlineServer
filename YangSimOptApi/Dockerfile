From julia:1.6.2

ENV JULIA_NUM_THREADS=2
WORKDIR /opt/YangSimOptApi

COPY . .

RUN julia --project="." -e 'import Pkg; Pkg.instantiate();'
#RUN julia --project=. precompile.jl
EXPOSE 9527
CMD ["bash"]