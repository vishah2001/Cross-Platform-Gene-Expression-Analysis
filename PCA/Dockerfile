# Fill files in algorun_info folder and put your source code in src folder
FROM algorun/algorun

# Install any algorithm dependencies here
RUN apt-get update && \
apt-get install -y r-base
RUN echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile
RUN Rscript -e "install.packages('ggplot2')"

# [Don't change the next two lines] Add source files to the Docker image
ADD ./algorun_info /home/algorithm/web/algorun_info/
ADD ./src /home/algorithm/src/

# [Optional] Compile/build your source code
# 

# [Optional] Sign your image
LABEL maintainer 'Vishal Shah <vishah2001@gmail.com>'
