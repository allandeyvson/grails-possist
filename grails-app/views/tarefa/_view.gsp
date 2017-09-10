<div class="panel panel-default">
    <div class="panel-heading">
        <label>Logs da Tarefa</label>
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-sm-12">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>Usuario</th>
                        <th>Data de Cadastro</th>
                        <th>Texto</th>
                        <th>%</th>
                        <th>Status</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr v-for="logTarefa in logsTarefa" :key="logTarefa.id">
                        <td>{{logTarefa.usuarioLog}}</td>
                        <td>{{logTarefa.dateCreated}}</td>
                        <td>{{logTarefa.texto}}</td>
                        <td>{{logTarefa.porcentagem}}</td>
                        <td>{{logTarefa.status}}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
