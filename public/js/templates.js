this.GamesPortal=this.GamesPortal||{},this.GamesPortal.templates=this.GamesPortal.templates||{},this.GamesPortal.templates["games-list"]=Handlebars.template({1:function(a,e,l,t){var s,n=this.lambda,i=this.escapeExpression;return'    <div class="game-item">\n        <a href="'+i(n(null!=a?a.gamePlayUrl:a,a))+'">\n            <img src="'+i(n(null!=(s=null!=(s=null!=a?a.mediaFiles:a)?s.ICON:s)?s[130]:s,a))+'">\n        </a>\n        <a href="'+i(n(null!=a?a.gamePlayUrl:a,a))+'">\n            <h3>'+i(n(null!=a?a.name:a,a))+"</h3>\n        </a>\n    </div>\n"},compiler:[6,">= 2.0.0-beta.1"],main:function(a,e,l,t){var s;return null!=(s=e.each.call(a,a,{name:"each",hash:{},fn:this.program(1,t,0),inverse:this.noop,data:t}))?s:""},useData:!0});