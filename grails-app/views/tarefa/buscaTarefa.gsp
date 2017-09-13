<!DOCTYPE html>
<%@ page import="br.edu.unirn.tipos.StatusTarefa" %>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'tarefa.label', default: 'Tarefa')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
        <body>
        <div id="tarefa" v-cloak="">
            <h1>Buscar Tarefa</h1>

            <div class="panel panel-default">
            <div class="panel-body">
                <div class="form-group">
                    <label for="titulo" class="col-sm-2 control-label">Título</label>
                    <div class="col-sm-10">
                        <input type="text" name="titulo" class="form-control" id="titulo" placeholder="Titulo" v-model="tarefa2.titulo">
                    </div>
                </div>
                <div class="form-group">
                    <label for="texto" class="col-sm-2 control-label">Texto</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="texto" name="texto" placeholder="Texto" v-model="tarefa2.texto">
                    </div>
                </div>
                <div class="form-group">
                    <label for="usuarioAbertura" class="col-sm-2 control-label">Usuario Abertura</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="usuarioAbertura" name="usuarioAbertura" placeholder="Usuario Abertura" v-model="tarefa2.usuarioAbertura">
                    </div>
                </div>
                <div class="form-group">
                    <label for="usuarioResponsavel" class="col-sm-2 control-label">Usuario Responsável</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="usuarioResponsavel" name="usuarioResponsavel" placeholder="Usuario Responsável" v-model="tarefa2.usuarioResponsavel">
                    </div>
                </div>
                <div class="form-group">
                    <label for="tipoTarefa" class="col-sm-2 control-label">Tipo Tarefa</label>
                    <div class="col-sm-10">
                        <g:select name="tipoTarefa" class="form-control" v-model="tarefa2.tipoTarefa" noSelection="['':'-- Selecione --']"
                                  from="${br.edu.unirn.TipoTarefa.list()}" optionValue="descricao" optionKey="descricao" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="statusTarefa" class="col-sm-2 control-label">Status Tarefa</label>
                    <div class="col-sm-10">
                        <g:select name="statusTarefa" class="form-control" v-model="tarefa2.statusTarefa" noSelection="['':'-- Selecione --']"
                                  from="${br.edu.unirn.tipos.StatusTarefa.values()}" optionValue="descricao" keys="${br.edu.unirn.tipos.StatusTarefa?.values()*.name()}" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12" style="text-align:center">
                        <button class="btn btn-success" @click="buscaTarefas">Buscar</button>
                    </div>
                </div>
             </div>
             </div>


              <div class="panel panel-default">
              <div class="panel-heading">Resultado</div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-sm-12">
                            </div>
                            <div class="col-sm-12">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Titulo</th>
                                        <th>Usuario Abertura</th>
                                        <th>Usuario Resp.</th>
                                        <th>Data Limite</th>
                                        <th>Tipo Tarefa</th>
                                        <th>Status</th>
                                        <th>%</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-if="loading">
                                        <td colspan="7">Carregando....</td>
                                    </tr>
                                    <tr v-for="tarefa in tarefas" :key="tarefa.id">
                                        <td>{{tarefa.titulo}}</td>
                                        <td>{{tarefa.usuarioAbertura}}</td>
                                        <td>{{tarefa.usuarioResponsavel}}</td>
                                        <td>{{tarefa.dataLimite}}</td>
                                        <td>{{tarefa.tipoTarefa}}</td>
                                        <td>{{tarefa.statusTarefa}}</td>
                                        <td>{{tarefa.porcentagem}}</td>
                                        <td>
                                            <button class="btn btn-success pull-right" @click="visualizarTarefa(tarefa)">
                                                Visualizar
                                            </button>
                                         </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
              </div>

              <div class="modal fade" tabindex="-1" role="dialog" id="formVisualizar">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Detalhes Tarefa</h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal">
                                <g:render template="form"/>
                            </form>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal">
                                <g:render template="view"/>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" @click="novoLogTarefa">Novo Log</button>
                            <button  type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                        </div>
                    </div>
                </div>
              </div>

              <div class="modal fade" tabindex="-1" role="dialog" id="formLogTarefa">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title"> Cadastrar Log Tarefa</h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal">
                                <g:render template="formLog"/>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" @click="salvarLog"><i class="fa fa-floppy-o"></i> Salvar</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        </div>
                    </div>
                </div>
              </div>

             </div>
        <content tag="javascript">
            <asset:javascript src="controllers/tarefa.js"/>
        </content>
        </div>
        </body>
</html>