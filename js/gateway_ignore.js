/* Copyright (c) 2020 k4be and the PIRC.pl Team
 * 
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

var ignoreData = {
	'full': {
		'channel': [],
		'query': []
	},
	'wildcard': {
		'channel': [],
		'query': []
	}
};

var ignore = {
	'ignoring': function(nick, type, dontProcessWildcard) {
		if(nick.isInList(servicesNicks)){
			return false;
		}
		if($.inArray(nick, ignoreData.full[type]) >= 0){
			return true;
		}
		if(dontProcessWildcard){
			if($.inArray($$.wildcardToRegex(nick), ignoreData.wildcard[type]) >= 0){
				return true;
			}
		} else {
			for(var i = 0; i < ignoreData.wildcard[type].length; i++){
				var regex = ignoreData.wildcard[type][i];
				console.log(nick);
				console.log(regex);
				if(nick.match(new RegExp(regex))){
					return true;
				}
			}
		}
		return false;
	},
	'getIgnoreList': function() {
		var data = [];
		for(var i=0; i < ignoreData.full.channel.length; i++){
			data.push(['channel', ignoreData.full.channel[i]]);
		}
		for(var i=0; i < ignoreData.full.query.length; i++){
			data.push(['query', ignoreData.full.query[i]]);
		}
		for(var i=0; i < ignoreData.wildcard.channel.length; i++){
			data.push(['channel', $$.regexToWildcard(ignoreData.wildcard.channel[i])]);
		}
		for(var i=0; i < ignoreData.wildcard.query.length; i++){
			data.push(['query', $$.regexToWildcard(ignoreData.wildcard.query[i])]);
		}
		return data;
	},
	'showIgnoreManagement': function() {
		var data = ignore.getIgnoreList();
		if($$.getDialogSelector('ignore', 'ignorelist').length != 0){
			$$.closeDialog('ignore', 'ignorelist');
		}
		if(data.length == 0){
			var html = language.listIsEmpty;
		} else {
			var html = '<div class="beIListContents"><table><tr><th>' + language.appliesTo + '</th><th>Maska</th></tr></table></div>';
		}
		$$.displayDialog('ignore', 'ignorelist', language.listOfIgnoredUsers, html);
		for(var i=0; i<data.length; i++){
			var ignoreT = data[i][0];
			if(ignoreT == 'channel'){
				var ignoreType = language.channelSmall;
			} else {
				var ignoreType = language.privateDiscussionSmall;
			}
			var ignoreMask = data[i][1];
			var html = '<tr><td>'+ignoreType+'</td><td>'+he(ignoreMask)+'</td>' +
				'<td><button id="unignore_'+ignoreT+'_'+md5(ignoreMask)+'">' + language.remove + '</button>' +
				'</td></tr>';
			$('table', $$.getDialogSelector('ignore', 'ignorelist')).append(html);
			$('#unignore_'+ignoreT+'_'+md5(ignoreMask)).click({type: ignoreT, mask: ignoreMask}, function(e){
				ignore.unIgnore(e.data.type, e.data.mask);
				ignore.showIgnoreManagement();
			});
		}
		var html = '<hr style="margin-top:5px;margin-bottom:5px;"><strong>' + language.addListEntry + '</strong><br>'+
			'<p><input type="text" id="new_ignore_mask"></p>' +
			'<p><input type="checkbox" id="new_ignore_query"> ' + language.privateMessages + '<br><input type="checkbox" id="new_ignore_channel"> ' + language.channelMessages + '</p>' +
			'<p><input type="button" value="' + language.add + '" onclick="ignore.ignoreClickInput();"></p>';
		$$.getDialogSelector('ignore', 'ignorelist').append(html);
	},
	'unIgnore': function(type, mask){
		ignore.changeIgnoreList(type, mask, false);
	},
	'changeIgnoreList': function(type, mask, add) {
		var wildcard = false;
		if(mask.indexOf('?') >= 0 || mask.indexOf('*') >= 0){
			var wildcard = true;
			var regex = $$.wildcardToRegex(mask);
		}
		try {
			if(add){
				if(ignore.ignoring(mask, type, true)){
					return; //już jest
				}
				if(wildcard){
					ignoreData.wildcard[type].push(regex);
				} else {
					ignoreData.full[type].push(mask);
				}
				if(type == 'channel'){
					var pattern = language.messagePatterns.channelIgnoreAdded;
				} else {
					var pattern = language.messagePatterns.queryIgnoreAdded;
				}
			} else {
				if(!ignore.ignoring(mask, type, true)){
					return; //nie ma czego usuwać
				}
				//try {
					if(wildcard){
						ignoreData.wildcard[type].splice(ignoreData.wildcard[type].indexOf(regex), 1);
					} else {
						ignoreData.full[type].splice(ignoreData.full[type].indexOf(mask), 1);
					}
			//	} catch (e) {
			//	}
				if(type == 'channel'){
					var pattern = language.messagePatterns.channelIgnoreRemoved;
				} else {
					var pattern = language.messagePatterns.queryIgnoreRemoved;
				}
			}
			gateway.statusWindow.appendMessage(pattern, [$$.niceTime(), he(mask)]);
			gateway.statusWindow.markBold();
			localStorage.setItem('ignore', JSON.stringify(ignoreData));
		} catch(e){
			$$.displayDialog('error', 'ignore', language.error, language.operationFailed);
		}
	},
	'ignoreClickInput': function() {
		var channel = $('#new_ignore_channel').prop('checked');
		var query = $('#new_ignore_query').prop('checked');
		var mask = $('#new_ignore_mask').val();
		if(mask.length == 0){
			$$.alert(language.noMaskGiven);
			return;
		}
		if(mask.indexOf(' ') > -1){
			$$.alert(language.maskCantContainSpaces);
			return;
		}
		if(!channel && !query){
			$$.alert(language.neitherChannelNorQuerySelected);
			return;
		}
		if(channel && mask == '*'){
			$$.alert(language.cantIgnoreAllInChannels);
			return;
		}
		if(channel){
			ignore.changeIgnoreList('channel', mask, true);
		}
		if(query){
			ignore.changeIgnoreList('query', mask, true);
		}
		ignore.showIgnoreManagement();
	},
	'ignoreClick': function(nick) {
		ignore.changeIgnoreList('query', nick, $('#'+md5(nick)+'_ignore_query').prop('checked'));
		ignore.changeIgnoreList('channel', nick, $('#'+md5(nick)+'_ignore_channel').prop('checked'));
	},
	'askIgnore': function(nick) {
		if(nick.isInList(servicesNicks)){
			$$.displayDialog('error', 'ignore', language.error, language.cantIgnoreNetworkService, 'OK');
			return;
		}
		var chanExplIgnored = ignore.ignoring(nick, 'channel', true);
		var queryExplIgnored = ignore.ignoring(nick, 'query', true);
		var ignoredByWildcard = false;
		if(!chanExplIgnored && !queryExplIgnored){
			if(ignore.ignoring(nick, 'channel') || ignore.ignoring(nick, 'query')){
				ignoredByWildcard = true;
			}
		}
		var html =
			'<p><input type="checkbox" id="'+md5(nick)+'_ignore_query"> ' + language.ignorePMs + '</p>' +
			'<p><input type="checkbox" id="'+md5(nick)+'_ignore_channel"> ' + language.ignoreChanMsgs + '</p>';
		if(ignoredByWildcard){
			html += '<p>' + language.isIgnoredByWildcards + '</p>';
		}
		html += '<p><a href="javascript:ignore.showIgnoreManagement();">' + language.manageIgnored + '</a></p>';
		var button = [
			{
				text: language.cancel,
				click: function(){
					$(this).dialog('close');
				}
			},
			{
				text: language.applySetting,
				click: function(){
					ignore.ignoreClick(nick);
					$(this).dialog('close');
				}
			}
		];
		$$.displayDialog('ignore', 'ignore', language.ignoreUserNick+nick, html, button);
		if(chanExplIgnored){
			$('#'+md5(nick)+'_ignore_channel').prop('checked', true);
		}
		if(queryExplIgnored){
			$('#'+md5(nick)+'_ignore_query').prop('checked', true);
		}
	}
}

