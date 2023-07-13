<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

<head>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="robots" content="noindex, nofollow">
  <script type="text/javascript" src="https://cdn.lacunasoftware.com/libs/web-pki/lacuna-web-pki-2.16.1.min.js" integrity="sha256-m+PP8JYWZLctZIxqeHm1tld6dzCLfCx8Onjp7OjmZlQ=" crossorigin="anonymous"></script>
  <#if properties.meta?has_content>
    <#list properties.meta?split(' ') as meta>
                <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
            </#list>
        </#if>
        <title>${msg("loginTitle", (client.name!''))}</title>
        <link rel="icon" href="${url.resourcesPath}/img/favicon.ico"/>
        <#if properties.styles?has_content>
            <#list properties.styles?split(' ') as style>
                <link href="${url.resourcesPath}/${style}" rel="stylesheet"/>
            </#list>
        </#if>
        <#if properties.scripts?has_content>
            <#list properties.scripts?split(' ') as script>
                <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
            </#list>
        </#if>
        <#if scripts??>
            <#list scripts as script>
                <script src="${script}" type="text/javascript"></script>
            </#list>
        </#if>
    </head>
    <body>
    <section class="painel">
        <img src="${url.resourcesPath}/img/torus.png" width="150px" />
        <form id="kc-form-login" class="login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
          <b class="titulo">
            ${msg("loginTitle",(realm.displayName!''))}
          </b>
          <div class="input_box">
            <label>Usuario</label>
            <input type="text" name="username"/>
          </div>
          <div class="input_box">
            <label>Senha</label>
            <input type="password" name="password"/>
          </div>
          <div>
            <button type="submit">Entrar</button>
          </div>
        </form>
        <div class="login">
          <button onclick="loginComCertificado()">Entrar com certificado digital</button>
        </div>
      </section>
      <footer class="footer">
        &copy; <span id="year"></span> PoligonalApps. Todos os direitos reservados.
      </footer>
      <script>
        var currentYear = new Date().getFullYear();
        document.getElementById("year").innerHTML = currentYear;
      </script>
    </body>

  </html>