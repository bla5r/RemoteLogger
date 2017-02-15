.class public LRemoteLogger$Sender;
.super Landroid/os/AsyncTask;
.source "RemoteLogger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LRemoteLogger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "Sender"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method protected constructor <init>()V
    .registers 1

    .prologue
    .line 269
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 269
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, LRemoteLogger$Sender;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .registers 8

    .prologue
    .line 273
    :try_start_0
    array-length v2, p1

    const/4 v0, 0x0

    move v1, v0

    :goto_3
    if-ge v1, v2, :cond_43

    aget-object v3, p1, v1

    .line 274
    new-instance v0, Ljava/net/URL;

    const-string v4, "%RL_URL%"

    invoke-direct {v0, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 275
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 276
    const-string v4, "POST"

    invoke-virtual {v0, v4}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 277
    const-string v4, "Content-Type"

    const-string v5, "application/json"

    invoke-virtual {v0, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 278
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 279
    new-instance v4, Ljava/io/DataOutputStream;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 280
    invoke-virtual {v4, v3}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 281
    invoke-virtual {v4}, Ljava/io/DataOutputStream;->flush()V

    .line 282
    invoke-virtual {v4}, Ljava/io/DataOutputStream;->close()V

    .line 283
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_39} :catch_3d

    .line 273
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_3

    .line 286
    :catch_3d
    move-exception v0

    .line 287
    const-string v1, "Unable to send request"

    invoke-static {v0, v1}, LRemoteLogger;->access$000(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 289
    :cond_43
    const/4 v0, 0x0

    return-object v0
.end method
