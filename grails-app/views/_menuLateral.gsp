<aside class="wbs-aside hidden-print">
    <div class="aside-inner">
        <nav class="wbs-sidebar">
            <ul class="nav">
                <li id="principalSideOpt" class="active">
                    <a href="${createLink(uri: '/')}" title="Principal">
                        <span>Principal</span>
                    </a>
                </li>
                <li class="nav-heading">
                    <span>Cadastros</span>
                </li>
                <li id="alunoSideOpt">
                    <a href="${createLink(controller: 'tarefa')}" title="Tarefa">
                        <span>Tarefa</span>
                    </a>
                </li>
                <li id="usuarioSideOpt">
                    <a href="${createLink(controller: 'usuario')}" title="Usuario">
                        <span>Usuario</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</aside>
