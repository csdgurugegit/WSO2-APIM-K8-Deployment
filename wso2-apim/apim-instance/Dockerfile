FROM docker.wso2.com/wso2am:4.3.0
USER root

COPY lib/ /home/wso2carbon/wso2am-4.3.0/repository/components/lib/
COPY security/ /home/wso2carbon/wso2am-4.3.0/repository/resources/security/
COPY deployment.toml /home/wso2carbon/wso2am-4.3.0/repository/conf/

RUN apt-get -y update
                        
