# Fill files in algorun_info folder and put your source code in src folder
FROM algorun/algorun

# Install any algorithm dependencies here

RUN echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile

RUN apt-get update
RUN apt-get install -y r-base r-base-dev
RUN Rscript -e "version"

RUN apt-get install -y libssl-dev libcurl4-openssl-dev libxml2-dev libssh2-1-dev
RUN Rscript -e "source('https://bioconductor.org/biocLite.R')"

RUN Rscript -e "install.packages('data.table', dependencies=TRUE)"
RUN Rscript -e "install.packages('binr', dependencies=TRUE)"
RUN Rscript -e "install.packages('scales', dependencies=TRUE)"

RUN Rscript -e "install.packages('devtools', dependencies=TRUE)"
RUN Rscript -e "library(devtools)"
RUN Rscript -e "devtools::install_github('greenelab/TDM')"



# [Don't change the next two lines] Add source files to the Docker image
ADD ./algorun_info /home/algorithm/web/algorun_info/
ADD ./src /home/algorithm/src/

# [Optional] Compile/build your source code
#

# [Optional] Sign your image
LABEL maintainer 'Vishal Shah <vishah2001@gmail.com>'
