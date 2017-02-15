.class public LRemoteLogger;
.super Ljava/lang/Object;
.source "RemoteLogger.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LRemoteLogger$Sender;
    }
.end annotation


# static fields
.field private static final EXECID:Ljava/lang/String;

.field private static REQUEST:I = 0x0

.field private static STACK:Lorg/json/JSONArray; = null

.field private static final URL:Ljava/lang/String; = "%RL_URL%"

.field private static VARS:Lorg/json/JSONArray;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 21
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, LRemoteLogger;->EXECID:Ljava/lang/String;

    .line 22
    const/4 v0, 0x1

    sput v0, LRemoteLogger;->REQUEST:I

    .line 23
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    sput-object v0, LRemoteLogger;->VARS:Lorg/json/JSONArray;

    .line 24
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    sput-object v0, LRemoteLogger;->STACK:Lorg/json/JSONArray;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 269
    return-void
.end method

.method static synthetic access$000(Ljava/lang/Exception;Ljava/lang/String;)V
    .registers 2

    .prologue
    .line 18
    invoke-static {p0, p1}, LRemoteLogger;->error(Ljava/lang/Exception;Ljava/lang/String;)V

    return-void
.end method

.method public static add(Ljava/lang/String;D)V
    .registers 6

    .prologue
    .line 104
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 105
    const-string v1, "key"

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 106
    const-string v1, "value"

    invoke-virtual {v0, v1, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 107
    sget-object v1, LRemoteLogger;->VARS:Lorg/json/JSONArray;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_14} :catch_15

    .line 112
    :goto_14
    return-void

    .line 109
    :catch_15
    move-exception v0

    .line 110
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to add double value: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, LRemoteLogger;->error(Ljava/lang/Exception;Ljava/lang/String;)V

    goto :goto_14
.end method

.method public static add(Ljava/lang/String;I)V
    .registers 5

    .prologue
    .line 60
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 61
    const-string v1, "key"

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 62
    const-string v1, "value"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 63
    sget-object v1, LRemoteLogger;->VARS:Lorg/json/JSONArray;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_14} :catch_15

    .line 68
    :goto_14
    return-void

    .line 65
    :catch_15
    move-exception v0

    .line 66
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to add int value: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, LRemoteLogger;->error(Ljava/lang/Exception;Ljava/lang/String;)V

    goto :goto_14
.end method

.method public static add(Ljava/lang/String;J)V
    .registers 6

    .prologue
    .line 82
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 83
    const-string v1, "key"

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 84
    const-string v1, "value"

    invoke-virtual {v0, v1, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 85
    sget-object v1, LRemoteLogger;->VARS:Lorg/json/JSONArray;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_14} :catch_15

    .line 90
    :goto_14
    return-void

    .line 87
    :catch_15
    move-exception v0

    .line 88
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to add long value: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, LRemoteLogger;->error(Ljava/lang/Exception;Ljava/lang/String;)V

    goto :goto_14
.end method

.method public static add(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    .prologue
    .line 38
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 39
    const-string v1, "key"

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 40
    const-string v1, "value"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 41
    sget-object v1, LRemoteLogger;->VARS:Lorg/json/JSONArray;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_14} :catch_15

    .line 46
    :goto_14
    return-void

    .line 43
    :catch_15
    move-exception v0

    .line 44
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to add string value: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, LRemoteLogger;->error(Ljava/lang/Exception;Ljava/lang/String;)V

    goto :goto_14
.end method

.method public static add(Ljava/lang/String;Z)V
    .registers 5

    .prologue
    .line 126
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 127
    const-string v1, "key"

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 128
    const-string v1, "value"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 129
    sget-object v1, LRemoteLogger;->VARS:Lorg/json/JSONArray;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_14} :catch_15

    .line 134
    :goto_14
    return-void

    .line 131
    :catch_15
    move-exception v0

    .line 132
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to add boolean value: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, LRemoteLogger;->error(Ljava/lang/Exception;Ljava/lang/String;)V

    goto :goto_14
.end method

.method public static addAndFlush(Ljava/lang/String;D)V
    .registers 4

    .prologue
    .line 192
    invoke-static {p0, p1, p2}, LRemoteLogger;->add(Ljava/lang/String;D)V

    .line 193
    invoke-static {}, LRemoteLogger;->flush()V

    .line 194
    return-void
.end method

.method public static addAndFlush(Ljava/lang/String;I)V
    .registers 2

    .prologue
    .line 162
    invoke-static {p0, p1}, LRemoteLogger;->add(Ljava/lang/String;I)V

    .line 163
    invoke-static {}, LRemoteLogger;->flush()V

    .line 164
    return-void
.end method

.method public static addAndFlush(Ljava/lang/String;J)V
    .registers 4

    .prologue
    .line 177
    invoke-static {p0, p1, p2}, LRemoteLogger;->add(Ljava/lang/String;J)V

    .line 178
    invoke-static {}, LRemoteLogger;->flush()V

    .line 179
    return-void
.end method

.method public static addAndFlush(Ljava/lang/String;Ljava/lang/String;)V
    .registers 2

    .prologue
    .line 147
    invoke-static {p0, p1}, LRemoteLogger;->add(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    invoke-static {}, LRemoteLogger;->flush()V

    .line 149
    return-void
.end method

.method public static addAndFlush(Ljava/lang/String;Z)V
    .registers 2

    .prologue
    .line 207
    invoke-static {p0, p1}, LRemoteLogger;->add(Ljava/lang/String;Z)V

    .line 208
    invoke-static {}, LRemoteLogger;->flush()V

    .line 209
    return-void
.end method

.method public static addStackTrace()V
    .registers 3

    .prologue
    .line 219
    :try_start_0
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 220
    new-instance v1, Ljava/lang/Throwable;

    invoke-direct {v1}, Ljava/lang/Throwable;-><init>()V

    new-instance v2, Ljava/io/PrintWriter;

    invoke-direct {v2, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 221
    sget-object v1, LRemoteLogger;->STACK:Lorg/json/JSONArray;

    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1b} :catch_1c

    .line 226
    :goto_1b
    return-void

    .line 223
    :catch_1c
    move-exception v0

    .line 224
    const-string v1, "Unable to add stack trace"

    invoke-static {v0, v1}, LRemoteLogger;->error(Ljava/lang/Exception;Ljava/lang/String;)V

    goto :goto_1b
.end method

.method private static error(Ljava/lang/Exception;Ljava/lang/String;)V
    .registers 5

    .prologue
    .line 259
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[RemoteLogger] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 260
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 261
    return-void
.end method

.method public static flush()V
    .registers 4

    .prologue
    .line 236
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 237
    const-string v1, "ts"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 238
    const-string v1, "exec"

    sget-object v2, LRemoteLogger;->EXECID:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 239
    const-string v1, "r"

    sget v2, LRemoteLogger;->REQUEST:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 240
    const-string v1, "vars"

    sget-object v2, LRemoteLogger;->VARS:Lorg/json/JSONArray;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 241
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    sput-object v1, LRemoteLogger;->VARS:Lorg/json/JSONArray;

    .line 242
    const-string v1, "stack"

    sget-object v2, LRemoteLogger;->STACK:Lorg/json/JSONArray;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 243
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    sput-object v1, LRemoteLogger;->STACK:Lorg/json/JSONArray;

    .line 244
    new-instance v1, LRemoteLogger$Sender;

    invoke-direct {v1}, LRemoteLogger$Sender;-><init>()V

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v3

    invoke-virtual {v1, v2}, LRemoteLogger$Sender;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 245
    sget v0, LRemoteLogger;->REQUEST:I

    add-int/lit8 v0, v0, 0x1

    sput v0, LRemoteLogger;->REQUEST:I
    :try_end_50
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_50} :catch_51

    .line 250
    :goto_50
    return-void

    .line 247
    :catch_51
    move-exception v0

    .line 248
    const-string v1, "Unable to flush"

    invoke-static {v0, v1}, LRemoteLogger;->error(Ljava/lang/Exception;Ljava/lang/String;)V

    goto :goto_50
.end method
