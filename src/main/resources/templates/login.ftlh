<#import "parts_macros/common.ftlh" as c>
<#import "parts_macros/login_p.ftlh" as l>

<@c.page>

    <h2>login.html</h2>

<#--    ${message?ifExists}-->
    <#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
        <div class="alert alert-danger" role="alert">
            ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
        </div>
    </#if>

    <@l.login "/login" false/>
<#--    <@l.registration "/registration" />-->
<#--    <br>-->
<#--    <a href="/registration">Add new User</a>-->

</@c.page>