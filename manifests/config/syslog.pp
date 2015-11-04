# ## Defined type wildfly::config::syslog
#
# ### Description
# This defined type configures Wildfly to log to the local syslog server.
#
# ### Parameters
# None.
#
# ### Variables
# None.
#
# ### Authors
# mike@marseglia.org
#
define wildfly::config::syslog {

  augeas { $name:
    lens    => 'Xml.lns',
    incl    => "${wildfly::dirname}/${wildfly::mode}/configuration/${wildfly::config}",
    changes => "set server/syslog-handler/syslog-handler[#attribute/name='${name}']/level/#attribute/name='INFO']}",
    onlyif  => "match server/interfaces/interface[#attribute/name='${name}']/inet-address[#attribute/value='${inet_address_value}'] size == 0"
  }

  <syslog-handler name="SYSLOG" enabled="true">
     <level name="INFO"/>
     <hostname value="i-XXXXXXX"/>
     <formatter><syslog-format syslog-type="RFC3164"/></formatter>
</syslog-handler>


<root-logger>
      <level name="INFO"/>
      <handlers>
          <handler name="SYSLOG"/>
          <handler name="CONSOLE"/>
          <handler name="FILE"/>
      </handlers>
</root-logger>
}
