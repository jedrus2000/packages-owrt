#!/usr/bin/haserl
<%
	# This program is copyright © 2014-2023 Cezary Jackiewicz and is distributed under the terms of the GNU GPL
	# version 2.0 with a special clarification/exception that permits adapting the program to
	# configure proprietary "back end" software provided that all modifications to the web interface
	# itself remain covered by the GPL.
	# See http://gargoyle-router.com/faq.html#qfoss for more information
	eval $( gargoyle_session_validator -c "$COOKIE_hash" -e "$COOKIE_exp" -a "$HTTP_USER_AGENT" -i "$REMOTE_ADDR" -r "login.sh" -t $(uci get gargoyle.global.session_timeout) -b "$COOKIE_browser_time"  )
	gargoyle_header_footer -h -s "status" -p "usbrelay" -j "table.js usbrelay.js" -z "usbrelay.js" -i usbrelay
%>

<script>
<!--
<%
	echo "ports = new Array();"
	/usr/lib/gargoyle/usbrelay.sh status | awk -F: '/:o/ {print "ports.push([\""$1"\",\""$2"\"]);" ;}'
%>
//-->
</script>

<h1 class="page-header"><%~ usbrelay.Relay %></h1>
<div class="row">
	<div class="col-lg-6">
		<div class="panel panel-default">
			<div class="panel-body">

			<div id="no_usbrelay" style="display:none;">
				<p><em><%~ NoRelay %></em></p>
			</div>
			<div id="usbrelay_table_container"></div>
			</div>
		</div>
	</div>
</div>

<script>
<!--
	resetData();
//-->
</script>

<%
	gargoyle_header_footer -f -s "status" -p "usbrelay"
%>
