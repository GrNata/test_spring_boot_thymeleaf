<#macro login path isRegistration>
    <form action="${path}" method="post">
        <div class="form-group row align-items-center">
            <label for="exampleInputUserName" class="col-2 col-form-label" > User Name :</label>
            <input type="text" name="username" value="<#if user??>${user.username}</#if>"
                   class="col-6 ${(usernameError??)?string('is-invalid', '')}"
                   placeholder="User name"/>
            <#if usernameError??>
                <div class="invalid-feedback">
                    ${usernameError}
                </div>
            </#if>
        </div>
        <div class="form-group row align-items-center mt-3">
            <label for="exampleInputPassword1" class="col-2"> Password: </label>
            <input type="password" name="password"
                   class="col-6 ${(passwordError??)?string('is-invalid', '')}"
                   placeholder="Password"/>
            <#if passwordError??>
                <div class="invalid-feedback">
                    ${passwordError}
                </div>
            </#if>
        </div>
        <#if isRegistration>
            <div class="form-group row align-items-center mt-3">
                <label for="exampleInputPassword1" class="col-2"> Password: </label>
                <input type="password" name="password2"
                       class="col-6 ${(password2Error??)?string('is-invalid', '')}"
                       placeholder="Retype password"/>
                <#if password2Error??>
                    <div class="invalid-feedback">
                        ${password2Error}
                    </div>
                </#if>
            </div>
            <div class="form-group row align-items-center mt-3">
                <label for="exampleInputPassword1" class="col-2"> Email: </label>
                <input type="email" name="email"
                       class="col-6 ${(emailError??)?string('is-invalid', '')}"
                       placeholder="some@some.com"/>
                <#if emailError??>
                    <div class="invalid-feedback">
                        ${emailError}
                    </div>
                </#if>
            </div>
        </#if>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

        <#if !isRegistration><a href="/registration" class="my-5">Добавить нового пользователя </a> </#if>
        <button type="submit"
                class="btn btn-primary m-5"/><#if isRegistration>Создать<#else>Sign In</#if>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-primary" >Sign Out</button>
    </form>
</#macro>


<#--<#macro registration path>-->
<#--    <form action="${path}" method="post">-->
<#--        <div><label> User Name : <input type="text" name="username"/> </label></div>-->
<#--        <div><label> Email: <input type="email" name="email"/> </label></div>-->
<#--        <div><label> Password: <input type="password" name="password"/> </label></div>-->
<#--        <input type="hidden" name="_csrf" value="${_csrf.token}"/>-->
<#--        <div><input type="submit" class="btn btn-primary"/>Sign In</div>-->
<#--    </form>-->
<#--</#macro>-->