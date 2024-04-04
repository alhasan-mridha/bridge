```
@JsonPropertyOrder(
    "サービス",
    "取引額",
    "利用料",
    "プラットフォーム利用料",
    "初期費用",
    "税",
    "返金額",
    "調整額",
    "キャッシュバック",
    "サービスごとの合計",
    "取引回数",
    "返金回数",
    "決済システム利用料",
    "自動振込利用料"
)
data class PayoutDetailsDownloadRecord(
    @field:JsonProperty("サービス")
    val serviceName: String,
    @field:JsonProperty("取引額")
    val transactionAmountTotal: Long?,
    @field:JsonProperty("利用料")
    val commissionFeeAmountTotal: Long = 0,
    @field:JsonProperty("プラットフォーム利用料")
    val chargeAmountTotal: Long? = null,
    @field:JsonProperty("初期費用")
    val monthlyFeeAmountTotal: Long? = null,
    @field:JsonProperty("税")
    val taxAmountTotal: Long = 0,
    @field:JsonProperty("返金額")
    val refundAmountTotal: Long?,
    @field:JsonProperty("調整額")
    val adjustmentAmountTotal: Long? = null,
    @field:JsonProperty("キャッシュバック")
    val cashbackAmountTotal: Long = 0,
    @field:JsonProperty("サービスごとの合計")
    val depositAmount: Long = 0,
    @field:JsonProperty("取引回数")
    val transactionCountTotal: Long? = null,
    @field:JsonProperty("返金回数")
    val refundCountTotal: Long? = null,
    @field:JsonProperty("決済システム利用料")
    val paymentFeeRate: String? = null,
    @field:JsonProperty("自動振込利用料")
    val earlyPayoutFeeRate: String? = null
)
```