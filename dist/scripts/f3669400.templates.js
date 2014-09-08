Ember.TEMPLATES.application=Ember.Handlebars.template(function(a,b,c,d,e){this.compilerInfo=[4,">= 1.0.0"],c=this.merge(c,Ember.Handlebars.helpers),e=e||{};var f,g,h="",i=this.escapeExpression;return e.buffer.push('<div class="main-container" id="main">\n  '),f={},g={},e.buffer.push(i(c._triageMustache.call(b,"outlet",{hash:{},contexts:[b],types:["ID"],hashContexts:g,hashTypes:f,data:e}))),e.buffer.push('\n  <footer class="col-xs-12">\n    <div class="feedback">\n      <h4>Have Feedback?</h4>\n      <a href="mailto:hello@kevnk.com" target="_blank">\n        <i class="fa fa-envelope-o fa-lg"></i> &nbsp;Email me\n      </a>\n      <a href="https://trello.com/b/vDjWlJLg/habits-public-board" target="_blank">\n        <i class="fa fa-trello fa-lg"></i> &nbsp;Add a card\n      </a>\n      <a href="https://github.com/kevnk/habits/issues" target="_blank">\n        <i class="fa fa-github fa-lg"></i> &nbsp;Add an issue\n      </a>\n    </div>\n  </footer>\n</div>\n\n<!-- Google Analytics -->\n<script>\n  (function(i,s,o,g,r,a,m){i[\'GoogleAnalyticsObject\']=r;i[r]=i[r]||function(){\n  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),\n  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)\n  })(window,document,\'script\',\'//www.google-analytics.com/analytics.js\',\'ga\');\n\n  ga(\'create\', \'UA-54551934-1\', \'auto\');\n  ga(\'send\', \'pageview\');\n\n</script>\n'),h}),Ember.TEMPLATES.habit_item_view=Ember.Handlebars.template(function(a,b,c,d,e){this.compilerInfo=[4,">= 1.0.0"],c=this.merge(c,Ember.Handlebars.helpers),e=e||{};var f,g,h,i,j="",k=c.helperMissing,l=this.escapeExpression;return e.buffer.push('<div class="row">\n  <div class="col-xs-10">\n    <input type="text" class="habit-input" tabindex="0" '),g={value:b},h={value:"ID"},i={hash:{value:"view.displayTitle"},contexts:[],types:[],hashContexts:g,hashTypes:h,data:e},e.buffer.push(l((f=c["bind-attr"]||b["bind-attr"],f?f.call(b,i):k.call(b,"bind-attr",i)))),e.buffer.push(" "),g={target:b,on:b},h={target:"STRING",on:"STRING"},e.buffer.push(l(c.action.call(b,"saveHabitTitle",{hash:{target:"view",on:"change"},contexts:[b],types:["ID"],hashContexts:g,hashTypes:h,data:e}))),e.buffer.push(" "),g={target:b,on:b},h={target:"STRING",on:"STRING"},e.buffer.push(l(c.action.call(b,"selectHabitTitle",{hash:{target:"view",on:"focus"},contexts:[b],types:["ID"],hashContexts:g,hashTypes:h,data:e}))),e.buffer.push(' />\n  </div>\n  <div class="pull-right">\n    <label '),g={"class":b},h={"class":"STRING"},i={hash:{"class":":fa :fa-lg :fa-check view.markedToday:marked"},contexts:[],types:[],hashContexts:g,hashTypes:h,data:e},e.buffer.push(l((f=c["bind-attr"]||b["bind-attr"],f?f.call(b,i):k.call(b,"bind-attr",i)))),e.buffer.push('>\n      <input class="hidden" type="checkbox" tabindex="-1" '),g={checked:b},h={checked:"ID"},i={hash:{checked:"view.markedToday"},contexts:[],types:[],hashContexts:g,hashTypes:h,data:e},e.buffer.push(l((f=c["bind-attr"]||b["bind-attr"],f?f.call(b,i):k.call(b,"bind-attr",i)))),e.buffer.push(" "),g={target:b,on:b},h={target:"STRING",on:"STRING"},e.buffer.push(l(c.action.call(b,"toggleMark",{hash:{target:"view",on:"change"},contexts:[b],types:["ID"],hashContexts:g,hashTypes:h,data:e}))),e.buffer.push("/>\n    </label>\n  </div>\n</div>"),j}),Ember.TEMPLATES.habits=Ember.Handlebars.template(function(a,b,c,d,e){function f(a,b){var d,e,f,h="";return b.buffer.push('\n<ul class="list-unstyled habit-list">\n  '),e={},f={},d=c.each.call(a,"habits",{hash:{},inverse:o.noop,fn:o.program(2,g,b),contexts:[a],types:["ID"],hashContexts:f,hashTypes:e,data:b}),(d||0===d)&&b.buffer.push(d),b.buffer.push("\n</ul>\n"),h}function g(a,b){var d,e,f="";return b.buffer.push("\n    "),d={content:a,idx:a},e={content:"ID",idx:"ID"},b.buffer.push(n(c.view.call(a,"Habitapp.HabitItemView",{hash:{content:"",idx:"contentIndex"},contexts:[a],types:["ID"],hashContexts:d,hashTypes:e,data:b}))),b.buffer.push("\n  "),f}this.compilerInfo=[4,">= 1.0.0"],c=this.merge(c,Ember.Handlebars.helpers),e=e||{};var h,i,j,k,l,m="",n=this.escapeExpression,o=this,p=c.helperMissing;return e.buffer.push('<div class="avg-container">\n  <div class="avg">'),j={},k={},e.buffer.push(n(c._triageMustache.call(b,"displayAvg",{hash:{},contexts:[b],types:["ID"],hashContexts:k,hashTypes:j,data:e}))),e.buffer.push('</div>\n  <div class="avg-bar" '),k={style:b},j={style:"ID"},l={hash:{style:"avgStyle"},contexts:[],types:[],hashContexts:k,hashTypes:j,data:e},e.buffer.push(n((h=c["bind-attr"]||b["bind-attr"],h?h.call(b,l):p.call(b,"bind-attr",l)))),e.buffer.push("></div>\n</div>\n\n"),j={},k={},i=c["if"].call(b,"habits.length",{hash:{},inverse:o.noop,fn:o.program(1,f,e),contexts:[b],types:["ID"],hashContexts:k,hashTypes:j,data:e}),(i||0===i)&&e.buffer.push(i),e.buffer.push("\n\n"),k={enter:b,placeholder:b,value:b,"class":b},j={enter:"STRING",placeholder:"STRING",value:"ID","class":"STRING"},l={hash:{enter:"addNewHabit",placeholder:"Add a habit",value:"newHabitValue","class":"new-habit-input"},contexts:[],types:[],hashContexts:k,hashTypes:j,data:e},e.buffer.push(n((h=c.input||b.input,h?h.call(b,l):p.call(b,"input",l)))),e.buffer.push("\n"),m}),Ember.TEMPLATES.index=Ember.Handlebars.template(function(a,b,c,d,e){this.compilerInfo=[4,">= 1.0.0"],c=this.merge(c,Ember.Handlebars.helpers),e=e||{},e.buffer.push('<div class="well">\n    Welcome to Yeoman and Ember.js!\n</div>\n')}),Ember.TEMPLATES.user=Ember.Handlebars.template(function(a,b,c,d,e){function f(a,b){var d,e,f="";return b.buffer.push("\n  <tr>\n    <td>\n      <strong>"),d={},e={},b.buffer.push(n(c._triageMustache.call(a,"key",{hash:{},contexts:[a],types:["ID"],hashContexts:e,hashTypes:d,data:b}))),b.buffer.push(":</strong>\n    </td>\n    <td>\n      "),d={},e={},b.buffer.push(n(c._triageMustache.call(a,"value",{hash:{},contexts:[a],types:["ID"],hashContexts:e,hashTypes:d,data:b}))),b.buffer.push("\n    </td>\n  </tr>\n  "),f}function g(a,b){b.buffer.push("Change")}this.compilerInfo=[4,">= 1.0.0"],c=this.merge(c,Ember.Handlebars.helpers),e=e||{};var h,i,j,k,l,m="",n=this.escapeExpression,o=this,p=c.helperMissing;return e.buffer.push("<h1>User</h1>\n\n<table>\n  "),j={},k={},h=c.each.call(b,"model.attributes",{hash:{},inverse:o.noop,fn:o.program(1,f,e),contexts:[b],types:["ID"],hashContexts:k,hashTypes:j,data:e}),(h||0===h)&&e.buffer.push(h),e.buffer.push("\n</table>\n\n"),j={},k={},l={hash:{},inverse:o.noop,fn:o.program(3,g,e),contexts:[b,b],types:["STRING","ID"],hashContexts:k,hashTypes:j,data:e},h=c["link-to"]||b["link-to"],i=h?h.call(b,"user.edit","model",l):p.call(b,"link-to","user.edit","model",l),(i||0===i)&&e.buffer.push(i),e.buffer.push("\n\n"),j={},k={},e.buffer.push(n(c._triageMustache.call(b,"outlet",{hash:{},contexts:[b],types:["ID"],hashContexts:k,hashTypes:j,data:e}))),e.buffer.push("\n"),m}),Ember.TEMPLATES["user/edit"]=Ember.Handlebars.template(function(a,b,c,d,e){function f(a,b){var d,e,f,g,h="";return b.buffer.push("\n  <tr>\n    <td>\n      <strong>"),e={},f={},b.buffer.push(k(c._triageMustache.call(a,"key",{hash:{},contexts:[a],types:["ID"],hashContexts:f,hashTypes:e,data:b}))),b.buffer.push(":</strong>\n    </td>\n    <td>\n      "),f={value:a},e={value:"ID"},g={hash:{value:"value"},contexts:[],types:[],hashContexts:f,hashTypes:e,data:b},b.buffer.push(k((d=c.input||a.input,d?d.call(a,g):l.call(a,"input",g)))),b.buffer.push("\n    </td>\n  </tr>\n  "),h}this.compilerInfo=[4,">= 1.0.0"],c=this.merge(c,Ember.Handlebars.helpers),e=e||{};var g,h,i,j="",k=this.escapeExpression,l=c.helperMissing,m=this;return e.buffer.push("<h1>User</h1>\n\n<table>\n  "),h={},i={},g=c.each.call(b,"buffer",{hash:{},inverse:m.noop,fn:m.program(1,f,e),contexts:[b],types:["ID"],hashContexts:i,hashTypes:h,data:e}),(g||0===g)&&e.buffer.push(g),e.buffer.push("\n</table>\n\n<button "),h={},i={},e.buffer.push(k(c.action.call(b,"save",{hash:{},contexts:[b],types:["STRING"],hashContexts:i,hashTypes:h,data:e}))),e.buffer.push(">Update</button>\n\n"),h={},i={},e.buffer.push(k(c._triageMustache.call(b,"outlet",{hash:{},contexts:[b],types:["ID"],hashContexts:i,hashTypes:h,data:e}))),e.buffer.push("\n"),j}),Ember.TEMPLATES.users=Ember.Handlebars.template(function(a,b,c,d,e){function f(a,b){var d,e,f,h,i,j="";return b.buffer.push("\n <li>"),f={},h={},i={hash:{},inverse:m.noop,fn:m.program(2,g,b),contexts:[a,a],types:["STRING","ID"],hashContexts:h,hashTypes:f,data:b},d=c["link-to"]||a["link-to"],e=d?d.call(a,"user","",i):n.call(a,"link-to","user","",i),(e||0===e)&&b.buffer.push(e),b.buffer.push("</li>\n  "),j}function g(a,b){var d,e;d={},e={},b.buffer.push(l(c._triageMustache.call(a,"id",{hash:{},contexts:[a],types:["ID"],hashContexts:e,hashTypes:d,data:b})))}this.compilerInfo=[4,">= 1.0.0"],c=this.merge(c,Ember.Handlebars.helpers),e=e||{};var h,i,j,k="",l=this.escapeExpression,m=this,n=c.helperMissing;return e.buffer.push("<h1>Users</h1>\n\n<ul>\n "),i={},j={},h=c.each.call(b,"model",{hash:{},inverse:m.noop,fn:m.program(1,f,e),contexts:[b],types:["ID"],hashContexts:j,hashTypes:i,data:e}),(h||0===h)&&e.buffer.push(h),e.buffer.push("\n</ul>\n\n"),i={},j={},e.buffer.push(l(c._triageMustache.call(b,"outlet",{hash:{},contexts:[b],types:["ID"],hashContexts:j,hashTypes:i,data:e}))),e.buffer.push("\n"),k});