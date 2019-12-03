FROM rocker/binder:3.6.0
LABEL maintainer='Brock_Rowley'
USER root
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}
USER ${NB_USER}



RUN wget https://github.com/RowleyBrock/EDLD_610_final_project/raw/master/DESCRIPTION && R -e "options(repos = list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/2019-12-03/')); install.packages("devtools"); devtools::install_deps()"

RUN rm DESCRIPTION.1; exit 0
