/**
 * Created by allan on 9/5/2017.
 */

var logTarefa = new Vue ({
    el : '#logTarefa',
    data : {
        logTarefas : [],
        logTarefa : {},
        loading : false
    }
/*    methods: {
        getLogTarefas: function () {
            this.loading = true;
            this.$http.get(window.baseUrl + "logTarefa/list/").then(function (resp) {
                this.logTarefas = resp.data;
                this.loading = false;
            }, function (err) {
                this.loading = false;
            })
        },

        novoLogTarefa: function () {
            this.logTarefa = {};
            $("#formTarefa").modal('show');
        },
    },
    ready: function(){
        this.getLogTarefas();
    }*/
});