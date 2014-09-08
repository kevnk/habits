(function(){var a;a=window.Habitapp=Ember.Application.create(),function(){a.StatsMixin=Ember.Mixin.create({avgStyle:function(){return"height:"+this.get("height")+"px;"}.property("height"),height:function(){var a,b;return b=$(".avg-container").height(),a=parseFloat(this.get("displayAvg")),b*(a/100)}.property("finalAvg","displayAvg"),finalAvg:function(){return Math.round(100*this.get("average"))}.property("average"),lastAvg:0,startingAvg:0,displayAvg:function(){var a,b,c,d,e,f=this;return c=this.get("lastAvg"),a=this.get("finalAvg"),d=Math.abs(a-c),b=Math.abs(a-this.get("startingAvg")),e=1-d/b,Ember.run.cancel(this.goingUp),Ember.run.cancel(this.goingDown),a>c&&d>1?(this.goingUp=Ember.run.later(function(){return f.set("lastAvg",c+1)},100*e),c+1+"%"):c>a&&d>1?(this.goingDown=Ember.run.later(function(){return f.set("lastAvg",c-1)},100*e),c-1+"%"):(this.set("startingAvg",a),a+"%")}.property("finalAvg","lastAvg"),average:function(){var a,b,c,d;return b=this.get("habits"),d=b.get("length"),c=[],a=0,b.forEach(function(a){var b,d,e,f;return d=a.get("marks"),e=d.get("length"),f=moment(Date.parse(a.get("createdAt"))),b=moment().diff(f,"days")+1,c.push(e/b)}),c.length&&(a=c.reduce(function(a,b){return a+b})/c.length),a}.property("habits.@each","marks.@each")})}.call(this),function(){a.HabitController=Ember.ObjectController.extend()}.call(this),function(){a.HabitsController=Ember.ObjectController.extend(a.StatsMixin,{habits:[],marks:[],setMarks:function(){return this.set("marks",this.get("store").find("mark"))}.observes("habits.@each"),actions:{addNewHabit:function(a){var b,c,d;return c=this.get("model"),d=c.get("store"),b=d.createRecord("habit",{idx:c.get("length")+1,title:a}),b.save(),this.set("newHabitValue","")}}})}.call(this),function(){a.UserController=Ember.ObjectController.extend()}.call(this),function(){a.UserEditController=Ember.ObjectController.extend({needs:"user",actions:{save:function(){var a;return a=this,this.get("buffer").forEach(function(b){return a.get("controllers.user.model").set(b.key,b.value)}),this.transitionToRoute("user",this.get("model"))}}})}.call(this),function(){a.UsersController=Ember.ObjectController.extend()}.call(this),function(){a.Store=DS.Store.extend(),a.ApplicationSerializer=DS.LSSerializer.extend(),a.ApplicationAdapter=DS.LSAdapter.extend({namespace:"habitapp"})}.call(this),function(){a.Habit=DS.Model.extend({title:DS.attr("string"),idx:DS.attr("number"),marks:DS.hasMany("mark"),createdAt:DS.attr("string",{defaultValue:function(){return new Date}})})}.call(this),function(){a.Mark=DS.Model.extend({habit:DS.belongsTo("habit"),day:DS.attr("string"),createdAt:DS.attr("string",{defaultValue:function(){return new Date}})})}.call(this),function(){a.User=DS.Model.extend({createdAt:DS.attr("string",{defaultValue:function(){return new Date}})}),a.User.reopen({attributes:function(){var a;return a=this,Ember.keys(this.get("data")).map(function(b){return Em.Object.create({model:a,key:b,valueBinding:"model."+b})})}.property()})}.call(this),function(){a.ApplicationRoute=Ember.Route.extend({setupController:function(){var a=this;return this.get("store").find("user").then(function(b){var c;return b.get("length")?void 0:(c=a.get("store").createRecord("user"),c.save())})}})}.call(this),function(){a.HabitRoute=Ember.Route.extend({model:function(a){return this.get("store").find("habit",a.habit_id)}})}.call(this),function(){a.HabitsRoute=Ember.Route.extend({model:function(){return this.get("store").find("habit")},setupController:function(a,b){return this._super(a,b),a.set("habits",b)}})}.call(this),function(){a.UserEditRoute=Ember.Route.extend({model:function(){return this.get("store").find("user",this.modelFor("user").id)},setupController:function(a,b){var c;return a.set("model",b),c=b.get("attributes").map(function(a){return{key:a.get("key"),value:a.get("value")}}),a.set("buffer",c)}})}.call(this),function(){a.UserRoute=Ember.Route.extend({model:function(a){return this.get("store").find("user",a.user_id)}})}.call(this),function(){a.UsersRoute=Ember.Route.extend({model:function(){return this.get("store").find("user")}})}.call(this),function(){a.HabitItemView=Em.View.extend({tagName:"li",classNames:"habit-item",classNameBindings:["isEditing:edit-mode","habitId"],templateName:"habit_item_view",isEditing:!1,habitId:function(){var a;return a=this.get("content.idx"),"habit-"+Math.min(a,20)}.property("content.idx"),$input:function(){return this.$().find("input[type=text]").first()}.property(),$checkbox:function(){return this.$().find("input[type=checkbox]").first()}.property(),todaysMarks:function(){return this.get("habit").get("marks").filterBy("day",moment().format("YYYY-MM-DD"))}.property("habit.marks.@each"),markedToday:function(){return this.get("todaysMarks").length>0}.property("todaysMarks"),habit:function(){var a;return a=this.get("content"),this.get("controller.model").find(function(b){return b===a})}.property("content"),displayTitle:Ember.computed.alias("content.title"),setHabitOrder:function(){return this.send("saveHabitOrder",this.get("contentIndex"))}.observes("contentIndex"),selectAllOnFocus:function(){return this.get("$input").on("click",function(){return this.focus(),this.setSelectionRange(0,9999)})}.on("didInsertElement"),actions:{toggleMark:function(){var a,b,c,d;return(a=this.get("habit"))?(c=this.get("$checkbox").prop("checked"))?(b=a.get("store").createRecord("mark",{day:moment().format("YYYY-MM-DD"),timestamp:moment().toISOString(),habit:a}),a.get("marks").addObject(b),a.save().then(function(){return a.get("marks").forEach(function(a){return a.save()})})):(d=this.get("todaysMarks"),d.forEach(function(a){return a.deleteRecord(),a.save()}),a.save()):void 0},saveHabitTitle:function(a){var b,c;return(a=this.get("habit"))?(c=this.get("$input").val())?(a.set("title",$.trim(c)),a.save()):(b=Ember.A(),a.get("marks").forEach(function(a){return a.deleteRecord(),b.push(a.save())}),Ember.RSVP.Promise.all(b).then(function(){return a.deleteRecord(),a.save()})):void 0},saveHabitOrder:function(a){var b;return(b=this.get("habit"))?(b.set("idx",a),b.save()):void 0}}})}.call(this),function(){a.HabitView=Ember.View.extend()}.call(this),function(){a.HabitsView=Ember.View.extend()}.call(this),function(){a.UserEditView=Ember.View.extend()}.call(this),function(){a.UserView=Ember.View.extend()}.call(this),function(){a.UsersView=Ember.View.extend()}.call(this),function(){a.Router.map(function(){return this.resource("habits",{path:"/"},function(){return this.resource("habit",{path:"/:habit_id"}),this.route("create")}),this.resource("users",function(){return this.resource("user",{path:"/:user_id"},function(){return this.route("edit")}),this.route("create")})})}.call(this)}).call(this);