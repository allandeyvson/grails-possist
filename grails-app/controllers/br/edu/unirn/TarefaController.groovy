package br.edu.unirn

import grails.converters.JSON

class TarefaController {

    static scaffold = Tarefa

    def index(){}

    def save(){
        params << request.JSON
        Tarefa tarefa = new Tarefa()
        bindData(tarefa, params, [exclude:['dataLimite']])
        tarefa.dataLimite = params.date('dataLimite', 'dd/MM/yyyy')

        if(!tarefa.save(flush: true)){
            tarefa.errors.each {println it}
            render status: 500
            return
        }

        render status: 200
    }

    def show(){
        Tarefa tarefa = Tarefa.get(params.id)
        render([
                id: tarefa.id,
                titulo: tarefa.titulo,
                texto: tarefa.texto,
                usuarioAbertura: tarefa.usuarioAbertura.id,
                emailUsuarioAbertura: tarefa.usuarioAbertura.email,
                usuarioResponsavel: tarefa.usuarioResponsavel.id,
                emailUsuarioResponsavel: tarefa.usuarioResponsavel.email,
                dataLimite: tarefa.dataLimite.format("dd/MM/yyyy"),
                tipoTarefa: tarefa.tipoTarefa.id,
                descricaoTipoTarefa: tarefa.tipoTarefa.descricao,
                statusTarefa: tarefa.statusTarefa.name(),
                porcentagem: tarefa.porcentagem
        ] as JSON)
    }

    def list(){
        def retorno = []

        Tarefa.listOrderById().each {
            retorno.add([
                id: it.id,
                titulo: it.titulo,
                usuarioAbertura: it.usuarioAbertura.email,
                usuarioResponsavel: it.usuarioResponsavel?.email,
                dataLimite: it.dataLimite.format("dd/MM/yyyy"),
                tipoTarefa: it.tipoTarefa.descricao,
                statusTarefa: it.statusTarefa.name(),
                porcentagem: it.porcentagem
            ])
        }
0
        render retorno as JSON
    }

    def update(){
        params << request.JSON
        Tarefa tarefa = Tarefa.get(params.id)

        bindData(tarefa, params, [exclude:['dataLimite']])
        tarefa.dataLimite = params.date('dataLimite', 'dd/MM/yyyy')

        if(!tarefa.save(flush: true)){
            render status: 500
            return
        }

        render status: 200
    }
}
