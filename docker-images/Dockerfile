FROM ecpe4s/ubuntu20.04-runner-x86_64:2023-03-01

RUN mkdir -p /opt/qmcpack-ci-deps

COPY /spack.yaml /opt/qmcpack-ci-deps/

RUN cd /opt/qmcpack-ci-deps \
 && git clone https://github.com/spack/spack \
 && (cd spack && git checkout b17113b63dd656fd16872f64af99554c4a0148f8) \
 && . spack/share/spack/setup-env.sh \
 && spack -e . buildcache keys -it \
 && spack -e . concretize -f | tee concretize.log \
 && spack -e . install --cache-only \
 && spack clean -a

RUN rm -f /*.deb /*.run /*.tar.gz /*.whl /*.pub

RUN echo /opt/qmcpack-ci-deps/view/lib > /etc/ld.so.conf.d/qmcpack-ci-deps.conf \
 && ldconfig -v \
 && echo unset which >> /etc/bash.bashrc

ENV PATH=/opt/qmcpack-ci-deps/view/bin:$PATH

RUN updatedb
