	<body>
		<div id="background-wrapper"></div>
		<div id="not_connected_wrapper">
			<img src="/styles/img/gbg.png" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;" />
			<div id="not_connected_div">
				<div class="not-connected-text">
					<h3>Ładowanie / Loading</h3>
					<p>Aby korzystać z bramki należy włączyć obsługę JavaScript. / You must enable JavaScript to use the client.</p>
				</div>
			</div>
		</div>	
		
		<div id="query-umodes-dialog" title="Blokowanie wiadomości prywatnych">
			<span class="language-dontWantPrivateMessages"></span>
			<table>
				<tr>
					<td class="optionsCheckBox"><input type="checkbox" id="setUmodeD" onchange="disp.changeSettings(event)" /></td>
					<td class="info" class="language-dontWantAnyMessages"></td>
				</tr>
				<tr>
					<td class="optionsCheckBox"><input type="checkbox" id="setUmodeR" onchange="disp.changeSettings(event)" /></td>
					<td class="info" class="language-dontWantFromUnregistered"></td>
				</tr>
			</table>
		</div>
		<div id="options-dialog" title="Ustawienia">
			<table>
				<tr>
					<td class="optionsCheckBox"><input type="checkbox" id="noAvatars" onchange="disp.changeSettings(event)" /></td>
					<td class="info"><span class="language-dontShowAvatars"></span> <a href="javascript:void(0)" onclick="disp.showAvatarSetting()" class="language-setOwnAvatar"></a></td>
				</tr>
				<tr>
					<td class="optionsCheckBox"><input type="checkbox" id="showPartQuit" onchange="disp.changeSettings(event)" /></td>
					<td class="info language-dontShowJoinsQuits"></td>
				</tr>
				<tr>
					<td class="optionsCheckBox"><input type="checkbox" id="showNickChanges" onchange="disp.changeSettings(event)" /></td>
					<td class="info language-dontShowNickChanges"></td>
				</tr>
				<tr>
					<td class="optionsCheckBox"><input type="checkbox" id="showMode" onchange="disp.changeSettings(event)" /></td>
					<td class="info language-dontShowModes"></td>
				</tr>
				<tr>
					<td class="optionsCheckBox"><input type="checkbox" id="tabsListBottom" onchange="disp.changeSettings(event)" /> </td>
					<td class="info language-tabListOnBottom"></td>
				</tr>
				<tr title="Pokazuje informację user@host przy dołączaniu i opuszczaniu kanałów przez użytkowników">
					<td class="optionsCheckBox"><input type="checkbox" id="showUserHostnames" onchange="disp.changeSettings(event)" /></td>
					<td class="info language-showHostnames"></td>
				</tr>
				<tr>
					<td class="optionsCheckBox"><input type="checkbox" id="autoReconnect" onchange="disp.changeSettings(event)" checked="checked" /></td>
					<td class="info language-autoReconnect"></td>
				</tr>
				<tr title="Ustawienie nie wpływa na linki, które są już wyświetlone">
					<td class="optionsCheckBox"><input type="checkbox" id="displayLinkWarning" onchange="disp.changeSettings(event)" checked="checked" /></td>
					<td class="info language-unsafeLinkWarnings"></td>
				</tr>
				<tr>
					<td class="optionsCheckBox"><input type="checkbox" id="blackTheme" onchange="disp.changeSettings(event)" /></td>
					<td class="info language-darkTheme"></td>
				</tr>
				<tr>
					<td class="optionsCheckBox"><input type="checkbox" id="coloredNicks" onchange="disp.changeSettings(event)" checked="checked" /></td>
					<td class="info language-colorNicks"></td>
				</tr>
				<tr>
					<td class="optionsCheckBox"><input type="checkbox" id="newMsgSound" onchange="disp.changeSettings(event)" /></td>
					<td class="info language-newMsgSound"></td>
				</tr>
				<tr>
					<td class="optionsCheckBox"><input type="checkbox" id="dispEmoji" onchange="disp.changeSettings(event)" checked="checked" /></td>
					<td class="info language-showEmoji"></td>
				</tr>
				<tr>
					<td class="optionsCheckBox"><input type="checkbox" id="sendEmoji" onchange="disp.changeSettings(event)" /></td>
					<td class="info language-sendEmoji"></td>
				</tr>
				<tr>
					<td class="optionsCheckBox"><input type="checkbox" id="monoSpaceFont" onchange="disp.changeSettings(event)" /></td>
					<td class="info language-monospaceFont"></td>
				</tr>
				<tr>
					<td class="optionsCheckBox"><input type="checkbox" id="autoDisconnect" onchange="disp.changeSettings(event)" checked="checked" /></td>
					<td class="info language-autoDisconnect"></td>
				</tr>
				<tr style="display:none;">
					<td class="optionsCheckBox"><input type="checkbox" id="automLogIn" onchange="disp.changeSettings(event)" /></td>
					<td class="info language-autoConnect"></td>
				</tr>
				<tr>
					<td><input type="text" id="backlogCount" onchange="disp.changeSettings(event)" /></td>
					<td class="info language-backlogCount"></td>
				</tr>
				<tr title="Gdy rozmowa prywatna jest już otwarta, to, niezależnie od tego ustawienia, tam pojawią się wszystkie NOTICE">
					<td colspan="2">
						<span class="language-noticeDisplay"></span> &nbsp;
						<select id="noticeDisplay" onchange="disp.changeSettings(event)">
							<option value="0" class="language-popupWindow"></option>
							<option value="1" class="language-query"></option>
							<option value="2" class="language-statusTab"></option>
						</select>
					</td>
				</tr>
				<tr><td colspan="2"><a href="javascript:ignore.showIgnoreManagement();" class="language-manageIgnored"></a></td></tr>
			</table>
		</div>
		
		<div id="avatar-dialog" title="Avatar">
		</div>
		
		<div id="about-dialog" title="Informacje">
				<h3>Bramka WWW PIRC.PL</h3>
				<p><span class="language-version"></span>: <script type="text/javascript">document.write(gatewayVersion);</script></p>
				<p>&copy; 2010-2020 <a href="http://pirc.pl">PIRC.PL</a>. <span class="language-allRightsReserved"></span></p>
		</div>

		<div id="top_menu">
			<div id="leftarrow">
				<input class="top" type="image" src="/styles/img/g_lewo.png" value="" onClick="gateway.prevTab()" />
			</div>
			<div id="tab-wrapper">
				<ul class="tabs" id="tabs">
					<li id="--status-tab"><a href="javascript:void(0);" onclick="gateway.switchTab('--status')" class="switchTab language-statusTabName"></a><a href="#"></a></li>
				</ul>
			</div>
			<div id="rightarrow">
				<input class="top" type="image" src="/styles/img/g_prawo.png" value="" onClick="gateway.nextTab()" />
			</div>
		</div>
		
		<div id="options-box">
			<a id="button-tsize" href="javascript:void(0);" onclick="disp.showSizes();" title="Zmień rozmiar tekstu"></a>
			<a id="button-options" href="javascript:void(0);" onClick="disp.showOptions();" title="Ustawienia"></a> 
			<a id="button-about" href="javascript:void(0);" onClick="disp.showAbout();" title="Informacje o bramce"></a>
			<a id="button-quit" href="javascript:void(0);" onClick="gateway.clickQuit();" title="Rozłącz z IRC"></a> 
		</div>

		<div id="wrapper">
			<div id="info">
				<span id="--status-topic">
					<h1 class="language-statusTabName"></h1>
					<h2>------</h2>
				</span>
			</div>
			<div id="chatbox">
				<div id="chat-wrapper">
					<div style="width: 98%; margin: 0 auto; margin-top: 1%; margin-bottom: 1%;" id="main-window">
						<span id="--status-window"></span>
					</div>
				</div>
			</div>
			<div id="chstats">
				<div class="chstatswrapper">
					<span class="chstats-text language-statusWindow" id="--status-chstats"></span>
				</div>
			</div>
			<div id="nicklist-closed">
				<div id="nicklist-hide-button" class="closed" onclick="gateway.nickListToggle()"></div>
			</div>
			<div id="nicklist">
				<div id="nick-wrapper">
					<div style="margin: 0 auto; width: 93%; margin-top: 3%; margin-bottom: 3%;" id="nicklist-main">
						<div id="nicklist-hide-button" onclick="gateway.nickListToggle()"></div>
						<div id="nicklist-hide-wrap">
							<span id="--status-nicklist">
							</span>
						</div>
					</div>
				</div>
			</div>
			<div id="chlist">
				<div class="chlistwrapper">
					<div id="chlist-body" class="language-loadingWait"></div>
					<div id="chlist-button" onclick="gateway.toggleChanList()" class="language-extendChannelList"></div>
				</div>
			</div>
			<div id="nickopts">
				<div id="nickopts-wrapper">
					<div class="nickoptsButton language-nickOptions" onclick="gateway.toggleNickOpts()"></div>
					<ul id="nickOptions">
						<li id="nickRegister" onclick="services.registerMyNick()" class="language-registerNick"></li>
						<li onclick="services.changeMyNick()" class="language-changeNick"></li>
						<li onclick="disp.showQueryUmodes()" class="language-privateMessagesBlocking"></li>
						<!--<li class="nickRegistered" onclick="services.setCloak()">Ustaw automatycznego vhosta</li>-->
						<li class="nickRegistered language-requestAVhost" onclick="services.setVhost()"></li>
						<li class="nickRegistered language-showChannelsWithAccess" onclick="services.perform('ns', 'alist', true)"></li>
						<li class="nickRegistered language-showAutojoinChannels" onclick="services.perform('ns', 'ajoin list', true)"></li>
					</ul>
				</div>
			</div>
		</div>

		<div id="inputbox">
			<div id="input-wrapper">
				<table class="nostyle"><tr>
					<!--<td style="width: 150px; text-align: right;"><span id="usernick" class="yournickname">{$nick}</span></td>-->
					<td style="width: 10px;"><input type="image" src="/styles/img/plus.png" value="" class="completion" onClick="gateway.doComplete();$('#input').focus()" title="Uzupełnij nick lub polecenie [Tab]" /></td>
					<td style="padding-right: 10px; padding-left: 5px;"> <input id="input" type="text" name="input" class="input" /></td>
					<td style="width: 10px;"><input type="image" src="/styles/img/smiley_mu.png" class="symbols" onClick="disp.symbolWindowShow()" title="Emotikony i symbole" /></td>
					<td style="width: 10px;"><input type="image" src="/styles/img/kolorki.png" value="" class="insertColor" onClick="disp.colorWindowShow()" title="Kolory i formatowanie" /></td>
					<td style="width: 10px;"><input type="submit" value="&#11166;" class="submit" OnClick="gateway.enterPressed()" title="Wyślij [Enter]" /></td>
				</tr></table>
			</div>
		</div>

		<div class="statuswindow">
			<div class="status-close" onclick="gateway.closeStatus()">
				&#215;
			</div>
			<div class="status-text">
			</div>
		</div>
		
		<div id="color-dialog" title="Formatowanie tekstu">
			<div id="formatting-button" onclick="gateway.toggleFormatting()" class="language-insertFormatCodes"></div>
			<div id="formatting">
				<h3 class="language-insertColorCode"></h3>
				<table id="color-array">
				</table>
				<h3 class="language-insertSpecialCode"></h3>
				<button type="button" class="textFormat language-turnOffColor" onClick="gateway.insertCode(3)"></button>
				<button type="button" class="textFormat language-boldText" onClick="gateway.insertCode(2)"></button>
				<button type="button" class="textFormat language-reverseColors" onClick="gateway.insertCode(22)"></button>
				<button type="button" class="textFormat language-italicText" onClick="gateway.insertCode(29)"></button>
				<button type="button" class="textFormat language-underscoreText" onClick="gateway.insertCode(31)"></button>
	   			<button type="button" class="textFormat language-clearFormats" onClick="gateway.insertCode(15)"></button>
	   		</div>
   		</div>
		
		<div id="symbol-dialog" title="Symbole">
			<h3 class="language-emoticons"></h3>
			<div id="emoticon-symbols"></div>
			<div class="dfooter"><a href="javascript:void(0)" onclick="disp.showAllEmoticons()" class="language-showAllAvailable"></a> <span class="language-thisCanTakeTime"></span></div>
			<h3 class="language-engineeringSymbols"></h3>
			<div id="engineer-symbols">
				<a class="charSelect" onclick="gateway.insert('µ')">µ</a> <a class="charSelect" onclick="gateway.insert('Ω')">Ω</a> <a class="charSelect" onclick="gateway.insert('φ')">φ</a> <a class="charSelect" onclick="gateway.insert('Δ')">Δ</a>
				<a class="charSelect" onclick="gateway.insert('Θ')">Θ</a> <a class="charSelect" onclick="gateway.insert('Λ')">Λ</a> <a class="charSelect" onclick="gateway.insert('Σ')">Σ</a> <a class="charSelect" onclick="gateway.insert('Φ')">Φ</a>
				<a class="charSelect" onclick="gateway.insert('Ψ')">Ψ</a> <a class="charSelect" onclick="gateway.insert('α')">α</a> <a class="charSelect" onclick="gateway.insert('β')">β</a> <a class="charSelect" onclick="gateway.insert('χ')">χ</a>
				<a class="charSelect" onclick="gateway.insert('τ')">τ</a> <a class="charSelect" onclick="gateway.insert('δ')">δ</a> <a class="charSelect" onclick="gateway.insert('ε')">ε</a> <a class="charSelect" onclick="gateway.insert('η')">η</a>
				<a class="charSelect" onclick="gateway.insert('ψ')">ψ</a> <a class="charSelect" onclick="gateway.insert('θ')">θ</a> <a class="charSelect" onclick="gateway.insert('λ')">λ</a> <a class="charSelect" onclick="gateway.insert('ξ')">ξ</a>
				<a class="charSelect" onclick="gateway.insert('ρ')">ρ</a> <a class="charSelect" onclick="gateway.insert('σ')">σ</a> <a class="charSelect" onclick="gateway.insert('√')">√</a> <a class="charSelect" onclick="gateway.insert('∞')">∞</a>
				<a class="charSelect" onclick="gateway.insert('∫')">∫</a> <a class="charSelect" onclick="gateway.insert('≈')">≈</a> <a class="charSelect" onclick="gateway.insert('≠')">≠</a> <a class="charSelect" onclick="gateway.insert('±')">±</a>
				<a class="charSelect" onclick="gateway.insert('ω')">ω</a> <a class="charSelect" onclick="gateway.insert('κ')">κ</a> <a class="charSelect" onclick="gateway.insert('π')">π</a> <a class="charSelect" onclick="gateway.insert('§')">§</a>
				<a class="charSelect" onclick="gateway.insert('Γ')">Γ</a> <a class="charSelect" onclick="gateway.insert('∑')">∑</a>
			</div>
		</div>
		<div id="size-dialog" title="Wybierz wielkość tekstu">
			<a onclick="javascript:disp.setSize(0.6)" style="font-size:0.6em">A</a>
			<a onclick="javascript:disp.setSize(0.8)" style="font-size:0.8em">A</a> 
			<a onclick="javascript:disp.setSize(1.0)" style="font-size:1.0em">A</a>
			<a onclick="javascript:disp.setSize(1.2)" style="font-size:1.2em">A</a> 
			<a onclick="javascript:disp.setSize(1.4)" style="font-size:1.4em">A</a> 
			<a onclick="javascript:disp.setSize(1.6)" style="font-size:1.6em">A</a> 
			<a onclick="javascript:disp.setSize(1.8)" style="font-size:1.8em">A</a> 
		 	<a onclick="javascript:disp.setSize(2.0)" style="font-size:2.0em">A</a>
		</div>
		<div id="sound"></div>
	</body>
</html>
