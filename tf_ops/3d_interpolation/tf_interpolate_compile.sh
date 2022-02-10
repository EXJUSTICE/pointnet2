CUDA_INC='/usr/local/cuda-11.0/include'
CUDA_LIB='/usr/local/cuda-11.0/lib64'

TF_CFLAGS=$(python -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_compile_flags()))')
TF_LFLAGS=$(python -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_link_flags()))')

g++ -std=c++11 tf_interpolate.cpp -o tf_interpolate_so.so -shared -fPIC $TF_CFLAGS $TF_LFLAGS -I$CUDA_INC -lcudart -L$CUDA_LIB -O2 -D_GLIBCXX_USE_CXX11_ABI=1
