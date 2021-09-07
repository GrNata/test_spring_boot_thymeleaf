<#import "parts_macros/common.ftlh" as c>
<#import "parts_macros/login_p.ftlh" as l>

<@c.page>
<#--    <div>-->
<#--        <@l.logout/>-->
<#--        <span><a href="/user">Список пользователей</a></span>-->
<#--    </div>-->

    <div>hello.html</div>

<#--    <div>-->
<#--        <form method="post" enctype="multipart/form-data">-->
<#--            <input type="text" name="text" placeholder="Введите сообщение"/>-->
<#--            <input type="text" name="tag" placeholder="Введите тэг"/>-->
<#--            <input type="file" name="file" placeholder="Введите сообщение"/>-->
<#--            <input type="hidden" name="_csrf" value="${_csrf.token}"/>-->
<#--            <button type="submit">Добавить</button>-->
<#--        </form>-->
<#--    </div>-->

<#--    Test-->
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
        Добавить сообщение
    </button>


<#--&lt;#&ndash; Раскрывающаяся форма &ndash;&gt;-->
<#--    <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"-->
<#--       aria-controls="collapseExample">-->
<#--        Добавить новое сообщение-->
<#--    </a>-->
<#--    <div class="collapse" id="collapseExample">-->
<#--&lt;#&ndash;        <div class="form-group mt-3">&ndash;&gt;-->
<#--        <div class="form-group mt-3">-->
<#--            <form method="post" enctype="multipart/form-data">-->
<#--                <div class="form-group row mt-3">-->
<#--                    <input type="text" class="form-contol ${(textError??)?string('is-invalid', '')}"-->
<#--                           value="<#if message??>${message.text}</#if>" name="text" placeholder="Введите сообщение"/>-->
<#--                    <#if textError??>-->
<#--                        <div class="invalid-feedback">-->
<#--                            ${textError} !!!-->
<#--&lt;#&ndash;                            ??????&ndash;&gt;-->
<#--                        </div>-->
<#--                    </#if>-->
<#--                </div>-->
<#--                <div class="form-group row mt-3">-->
<#--                    <input type="text" class="form-contol" name="tag" placeholder="Тэг">-->
<#--                </div>-->
<#--                <div class="form-group row mt-3">-->
<#--                    <div class="custom-file">-->
<#--                        <input type="file" name="file" id="customFile">-->
<#--                        &lt;#&ndash;                        <label class="custom-file-label" for="customFile">Choose file</label>&ndash;&gt;-->
<#--                    </div>-->
<#--                </div>-->
<#--                <input type="hidden" name="_csrf" value="${_csrf.token}"/>-->
<#--                <div class="form-group">-->
<#--                    <button type="submit" class="btn btn-primary ml-2">Добавить</button>-->
<#--                </div>-->
<#--            </form>-->
<#--        </div>-->
<#--    </div>-->



    <div>Список сообщений:</div>
    <form method="get" action="/hello">
        <input type="text" name="filter" value="${filter?ifExists}"/>
        <button type="submit">Найти</button>
    </form>

    <div class="row row-cols-1 row-cols-md-3 g-4">
        <#list messages as message>
            <div class="card my-3">
                <#if message.filename??>
                    <img src="/img/${message.filename}" class="card-img-top">
                </#if>
                <#--                </div>-->
                <div class="card-body">
                    <b>${message.id}</b>
                    <span>${message.text}</span>
                    <i>${message.tag}</i>
                    <strong>${message.authorName}</strong>
                </div>
            </div>
        <#else >
            No message
        </#list>
    </div>

<#--    <#list messages as message>-->
<#--        <div>-->
<#--            <b>${message.id}</b>-->
<#--            <span>${message.text}</span>-->
<#--            <i>${message.tag}</i>-->
<#--            <strong>${message.authorName}</strong>-->
<#--            <div>-->
<#--                <#if message.filename??>-->
<#--                &lt;#&ndash;                <#if message.filename>&ndash;&gt;-->
<#--                    <img src="/img/${message.filename}">-->
<#--                </#if>-->
<#--            </div>-->
<#--        </div>-->
<#--    <#else >-->
<#--        No message-->
<#--    </#list>-->



    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="container-fluid">
                <form method="post" enctype="multipart/form-data">
                    <div class="row col-8">
                        <div class="col-6">
                            <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                                   value="<#if message??>${message.text}</#if>" name="text" placeholder="Введите сообщение"/>

                            <#if textError??>
                                <div class="invalid-feedback">
                                    ${textError}
                                </div>
                            </#if>
                        </div>
                        <div class="col-1 offset-1">
                            <input type="text" name="tag" placeholder="Введите тэг"/>
                        </div>
                    </div>
                    <div class="row>">
                        <div class="col-8">
                            <input type="file" name="file" placeholder="Введите сообщение"/>
                        </div>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <div>
                        <button type="submit" class="btn btn-primary">Добавить</button>
                    </div>
                    <#--                    </form>-->
                    <#--                </form>-->

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <#--                    <button type="submit" class="btn btn-primary">Save changes</button>-->
                    </div>
                </form>
            </div>
        </div>
    </div>



</@c.page>