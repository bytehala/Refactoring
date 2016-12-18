#!/usr/bin/env bash

locale-gen UTF-8

echo "Installing Apache.."
sudo apt-get install -y apache2
echo "Installing Tomcat.."
sudo apt-get install -y tomcat7
echo "Installing Tomcat7 docs.."
sudo apt-get install -y tomcat7-docs
echo "Installing Tomcat7 administration webapps.."
sudo apt-get install -y tomcat7-admin
echo "Installing Tomcat7 examples webapps.."
sudo apt-get install tomcat7-examples

echo "java 8 installation"
apt-get install --yes python-software-properties
add-apt-repository ppa:webupd8team/java
apt-get update -qq
echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | /usr/bin/debconf-set-selections
apt-get install --yes oracle-java8-installer
yes "" | apt-get -f install

echo 'Install Maven in /usr/share/maven...'
echo "------------------------"
sudo apt-cache search maven
sudo apt-get install maven -y

echo 'Setting JAVA_HOME'
echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle/" >> ~/.profile
