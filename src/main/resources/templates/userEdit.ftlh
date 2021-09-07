<#import "parts_macros/common.ftlh" as c>

<@c.page>
    Редактирование пользователя

    <form action="/user" method="post">
        <input type="text" name="username" value="${user.username}">
<#--        <input type="text" name="name" value="${user.name}">-->
        <#list roles as role>
            <div>
                <label>
                    <input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>
                    ${role}
<#--                    <input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?("checked", "")}>-->
                </label>
            </div>
        </#list>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit">Save</button>
    </form>
</@c.page>