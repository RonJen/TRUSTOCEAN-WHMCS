<link rel="stylesheet" href="/modules/servers/TRUSTOCEANSSL/assets/css/clientarea.css">
<script src="/modules/servers/TRUSTOCEANSSL/assets/js/clipboard.min.js"></script>
{* must included after JQuery and Clipboard.js *}



{*<script src="/modules/servers/TRUSTOCEANSSL/assets/js/clientarea.js"></script>*}
{* LANGUAGE FILE LIB*}
<script src="/modules/servers/TRUSTOCEANSSL/assets/js/lang/chinese.js"></script>
{include file="$assetsPath/js/clientarea-js.tpl" MODLANG=$MODLANG }

<script type="application/javascript">

</script>

{if $status==='configuration'}
    {include file="./enroll_csr.tpl"}
{/if}

{if $status==='enroll_organization_pre'}
    {include file="./enroll_organization_prevalidation.tpl"}
{/if}

{if $status==='enroll_dcv'}
    {include file="./enroll_dcv.tpl"}
{/if}

{if $status==='enroll_caprocessing' }
    {include file="./enroll_ca.tpl"}
{/if}


{*证书已经签发*}
{if $status === 'issued_active'}
<div class="panel panel-default panel-product-details ssl-container" style="text-align: left;">
    <div class="panel-body">
    <div class="module-client-area">
        <div class="section">
            <div class="section-header">
                <h3 class="text-success"><span class="fa fa-check" style="margin-right: 5px;"></span> {$MODLANG.trustoceanssl.enroll.issued.title}</h3>
                <p>{$MODLANG.trustoceanssl.enroll.issued.desc}</p>
                {if $vars.error}
                    {include file="$template/includes/alert.tpl" type="error" msg=$vars.error textcenter=false idname="alertModuleCustomButtonFailed"}
                {/if}
                {if $vars.info}
                    {include file="$template/includes/alert.tpl" type="success" msg=$vars.info textcenter=false idname="alertModuleCustomButtonFailed"}
                {/if}
                <a style="margin-top:10px;margin-right: 12px;" href="/clientarea.php?action=productdetails&id={$serviceid}&modop=custom&a=downloadcertificate" class="btn btn-success btn-sm btn-checkout" data-toggle="tooltip" data-title="{$MODLANG.trustoceanssl.enroll.issued.btn.dia1}"><i class="fas fa-ticket ls ls-download"></i> {$MODLANG.trustoceanssl.enroll.issued.btn.downloadcert}</a>
                {*<a style="margin-top:10px;margin-right: 12px;" href="javascript:;" onclick="$('a[data-convertssl]').click();" class="btn btn-success btn-sm btn-checkout" data-toggle="tooltip" data-title="{$MODLANG.trustoceanssl.enroll.issued.btn.dia2}"><i class="fas fa-ticket ls ls-download"></i> {$MODLANG.trustoceanssl.enroll.issued.btn.convertcert}</a>*}
                <a style="margin-top:10px;margin-right: 12px;" href="/clientarea.php?action=productdetails&id={$serviceid}&modop=custom&a=prepareForReissue" class="btn btn-info btn-sm btn-checkout" data-toggle="tooltip" data-title="{$MODLANG.trustoceanssl.enroll.issued.btn.dia3}"><i class="fas fa-ticket ls ls-refresh"></i> {$MODLANG.trustoceanssl.enroll.issued.btn.reissue}</a>
            </div>
        </div>
    </div>
    </div>
</div>
<div class="section ssl-container" style="text-align: left;" >
    <div class="panel panel-default">
        <div class="panel-nav">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#certdetails" data-toggle="tab"><i class="ls ls-configure"></i>{$MODLANG.trustoceanssl.enroll.issued.info.certinfo}</a>
                </li>
                <li>
                    <a href="#certificate"  data-convertssl data-toggle="tab"><i class="ls ls-configure"></i>{$MODLANG.trustoceanssl.enroll.issued.info.cert}</a>
                </li>
                <li>
                    <a href="#chaincertificate"  data-convertssl data-toggle="tab"><i class="ls ls-configure"></i>{$MODLANG.trustoceanssl.enroll.issued.info.chaincert}</a>
                </li>
            </ul>
        </div>
        <div class="tab-content">
            <div class="tab-pane" id="certificate">
                <ul class="list-info list-info-50 list-info-bordered cert-info-tb">
                    <li>
                        <span class="list-info-title">{$MODLANG.trustoceanssl.enroll.issued.info.cert}</span>
                        <textarea class="form-control" rows="25" style="width: 80%;">{$vars.cert}</textarea>
                    </li>
                </ul>
            </div>

            <div class="tab-pane" id="chaincertificate">
                <ul class="list-info list-info-50 list-info-bordered cert-info-tb">
                    <li>
                        <span class="list-info-title">{$MODLANG.trustoceanssl.enroll.issued.info.chaincert}</span>
                        <textarea class="form-control" rows="25" style="width: 80%;">{$vars.chainscert}</textarea>
                    </li>
                </ul>
            </div>

            <div class="tab-pane active" id="certdetails">
                <ul class="list-info list-info-50 list-info-bordered cert-info-tb">
                    <li>
                        <span class="list-info-title">{$MODLANG.trustoceanssl.enroll.issued.info.certno}</span>
                        <span class="list-info-text">{$x509.serialNumber}</span>
                    </li>
                    <li>
                        <span class="list-info-title">{$MODLANG.trustoceanssl.enroll.issued.info.cnname}</span>
                        <span class="list-info-text">{$x509.subject.CN}</span>
                    </li>
                    <li>
                        <span class="list-info-title">{$MODLANG.trustoceanssl.enroll.issued.info.status}</span>
                        <span class="list-info-text">
                            <i class="text-success" style="font-style: normal;"><span class="fa fa-check" style="margin-right: 5px;"></span> Valid</i>
                        </span>
                    </li>
                    <li>
                        <span class="list-info-title">{$MODLANG.trustoceanssl.enroll.issued.info.ca}</span>
                        <span class="list-info-text">{$x509.issuer.O}</span>
                    </li>
                    <li>
                        <span class="list-info-title">{$MODLANG.trustoceanssl.enroll.issued.info.subca}</span>
                        <span class="list-info-text">{$x509.issuer.CN}</span>
                    </li>
                    <li>
                        <span class="list-info-title">{$MODLANG.trustoceanssl.enroll.issued.info.signaglor}</span>
                        <span class="list-info-text">SN: {$x509.signatureTypeSN}<br>LN: {$x509.signatureTypeLN}</span>
                    </li>
                    <li>
                        <span class="list-info-title">{$MODLANG.trustoceanssl.enroll.issued.info.valid}</span>
                        <span class="list-info-text">{$MODLANG.trustoceanssl.enroll.issued.info.from}: {$x509.validFrom}<br>{$MODLANG.trustoceanssl.enroll.issued.info.to}: {$x509.validTo}</span>
                    </li>
                    <li>
                        <span class="list-info-title">{$MODLANG.trustoceanssl.enroll.issued.info.sanname}</span>
                        <span class="list-info-text">{$x509.extensions.subjectAltName}</span>
                    </li>
                    <li>
                        <span class="list-info-title">{$MODLANG.trustoceanssl.enroll.issued.info.ct}</span>
                        <span class="list-info-text"><i class="text-success" style="font-style: normal;"><span class="fa fa-check" style="margin-right: 5px;"></span></i>{$x509.extensions.ct_precert_scts}</span>
                    </li>
                </ul>
            </div>
            <div class="tab-pane" id="convertssl">
                <div class="panel-body">
                    <form action="/clientarea.php?action=productdetails&id={$serviceid}&modop=custom&a=convertssl" method="post">
                        <div class="form-group">
                            <label class="text-success">{lang key="trustoceanssl.enroll.issued.convert.desc" email=$client.email }</label>
                        </div>
                        <div class="m-w-416">
                            <div class="form-group">
                                <label for="inputNs1" class="control-label">{$MODLANG.trustoceanssl.enroll.issued.convert.privatekey}</label>
                                <textarea type="text" name="keycode" autocomplete="new-password" class="form-control domnsinputs" placeholder="{$MODLANG.trustoceanssl.enroll.issued.convert.privatekeydesc}" style="min-height: 250px;"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="inputNs1" class="control-label">{$MODLANG.trustoceanssl.enroll.issued.convert.keytoken}</label>
                                <input type="password" name="ktoken" autocomplete="new-password" class="form-control domnsinputs" placeholder="{$MODLANG.trustoceanssl.enroll.issued.convert.keytokendesc}" value="">
                            </div>
                            <div class="form-group">
                                <input type="submit"  class="btn btn-sm btn-success " placeholder="" value="{$MODLANG.trustoceanssl.enroll.issued.convert.convertbtn}">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
{/if}