export TOOLS="/devroot/tools"
export BUILD="$TOOLS/build"

export JAVA_HOME="/opt/jdk1.6.0_27"
export JBOSS_HOME="/devroot/containers/jboss-6.1.0.Final"

export ANT_HOME="$BUILD/apache-ant-1.8.2"
export H2_HOME="$TOOLS/database/h2"
export JREBEL_HOME="$TOOLS/jrebel"
export JMETER_HOME="$TOOLS/perf/apache-jmeter-2.6"
export M2_HOME="/usr/share/maven"

export PATH="$PATH:$ANT_HOME/bin:$JAVA_HOME/bin:$H2_HOME/bin:$JMETER_HOME/bin:$JREBEL_HOME/bin:$JRUBY_HOME/bin:$M2_HOME/bin"
export JRUBY_OPTS="-J-Xmx1024m -J-XX:MaxPermSize=512m" 
PATH=/home/ecodev/.nvm/v0.4.11/bin:/home/ecodev/.rvm/gems/jruby-1.6.7.2/bin:/home/ecodev/.rvm/gems/jruby-1.6.7.2@global/bin:/home/ecodev/.rvm/rubies/jruby-1.6.7.2/bin:/home/ecodev/.rvm/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/ruby/bin/:$ANT_HOME/bin:$H2_HOME/bin:$JAVA_HOME/bin:$JMETER_HOME/bin:$JREBEL_HOME/bin:$M2_HOME:$JRUBY_HOME/bin:$M2_HOME/bin


jb7ecx(){
	export JBOSS_HOME="/devroot/containers/jboss-as-7.1.1.Exchange"
	export 	JAVA_HOME="/devroot/tools/jdk1.7.0_17"
}

jb7(){
	export JBOSS_HOME="/devroot/containers/jboss-as-7.1.1.Final"
	export 	JAVA_HOME="/devroot/tools/jdk1.7.0_17"
}

jb6(){
	export JBOSS_HOME="/devroot/containers/jboss-6.1.0.Final"
	export 	JAVA_HOME="/opt/jdk1.6.0_27"
}

