<#import "parts_macros/common.ftlh" as c>
<#import "parts_macros/login_p.ftlh" as l>

<@c.page>
    <h2>!!!!! registration.html</h2>

    <a href="/login">Войти</a>
    <h2>Добавление нового пользователя</h2>
    ${message?ifExists}

    <@l.login "/registration" true/>
</@c.page>