.class public Lcom/android/server/wm/MoveWindowService;
.super Lmeizu/view/IMoveWindow$Stub;
.source "MoveWindowService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/wm/MoveWindowService$SimpleAnimatorListener;
    }
.end annotation


# static fields
.field public static DEBUG_MOVEWIN:Z = false

.field private static final MOVE_DOWN:I = 0x1

.field private static final MOVE_RESET:I


# instance fields
.field public mContext:Landroid/content/Context;

.field mH:Landroid/os/Handler;

.field mMWCb:Lmeizu/view/IMoveWinCallback;

.field public mRealWindowManager:Lcom/android/server/wm/WindowManagerService;

.field private movedFocusWin:Lcom/android/server/wm/WindowState;

.field private movedWinList:Lcom/android/server/wm/WindowList;

.field windowDownAnimator:Landroid/animation/ValueAnimator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 53
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/server/wm/MoveWindowService;->DEBUG_MOVEWIN:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/server/wm/WindowManagerService;Landroid/os/Handler;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "wms"    # Lcom/android/server/wm/WindowManagerService;
    .param p3, "handle"    # Landroid/os/Handler;

    .prologue
    .line 65
    invoke-direct {p0}, Lmeizu/view/IMoveWindow$Stub;-><init>()V

    .line 60
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    .line 61
    new-instance v0, Lcom/android/server/wm/WindowList;

    invoke-direct {v0}, Lcom/android/server/wm/WindowList;-><init>()V

    iput-object v0, p0, Lcom/android/server/wm/MoveWindowService;->movedWinList:Lcom/android/server/wm/WindowList;

    .line 66
    iput-object p2, p0, Lcom/android/server/wm/MoveWindowService;->mRealWindowManager:Lcom/android/server/wm/WindowManagerService;

    .line 67
    iput-object p1, p0, Lcom/android/server/wm/MoveWindowService;->mContext:Landroid/content/Context;

    .line 68
    iput-object p3, p0, Lcom/android/server/wm/MoveWindowService;->mH:Landroid/os/Handler;

    .line 69
    return-void
.end method

.method static synthetic access$000(Lcom/android/server/wm/MoveWindowService;)Lcom/android/server/wm/WindowState;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/wm/MoveWindowService;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/server/wm/MoveWindowService;I)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/wm/MoveWindowService;
    .param p1, "x1"    # I

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lcom/android/server/wm/MoveWindowService;->moveWinNormal(I)V

    return-void
.end method

.method static synthetic access$200(Lcom/android/server/wm/MoveWindowService;I)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/wm/MoveWindowService;
    .param p1, "x1"    # I

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lcom/android/server/wm/MoveWindowService;->moveWinDown(I)V

    return-void
.end method

.method static synthetic access$300(Lcom/android/server/wm/MoveWindowService;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/wm/MoveWindowService;

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/android/server/wm/MoveWindowService;->moveTopAppWinFrame()V

    return-void
.end method

.method static synthetic access$400(Lcom/android/server/wm/MoveWindowService;II)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/wm/MoveWindowService;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .prologue
    .line 52
    invoke-direct {p0, p1, p2}, Lcom/android/server/wm/MoveWindowService;->moveTopAppShowFrame(II)V

    return-void
.end method

.method static synthetic access$500(Lcom/android/server/wm/MoveWindowService;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/wm/MoveWindowService;

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/android/server/wm/MoveWindowService;->resetMoveWinMode()V

    return-void
.end method

.method private getMzIInputMethodManager()Lcom/android/internal/view/MzIInputMethodManager;
    .locals 2

    .prologue
    .line 284
    const-string v1, "input_method"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .line 285
    .local v0, "b":Landroid/os/IBinder;
    invoke-static {v0}, Lcom/android/internal/view/MzIInputMethodManagerProxy;->asInterfaceMz(Landroid/os/IBinder;)Lcom/android/internal/view/MzIInputMethodManager;

    move-result-object v1

    return-object v1
.end method

.method private initMoveWinMode()V
    .locals 8

    .prologue
    .line 240
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->mRealWindowManager:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v3, Lcom/android/server/wm/WindowManagerService;->mAppTransition:Lcom/android/server/wm/AppTransition;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->mRealWindowManager:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v3, Lcom/android/server/wm/WindowManagerService;->mAppTransition:Lcom/android/server/wm/AppTransition;

    invoke-virtual {v3}, Lcom/android/server/wm/AppTransition;->isRunning()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 241
    const-string v3, "Move_Win"

    const-string v4, "Transition is running, should not move window"

    invoke-static {v3, v4}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 281
    :goto_0
    return-void

    .line 245
    :cond_0
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->mRealWindowManager:Lcom/android/server/wm/WindowManagerService;

    iget-object v4, v3, Lcom/android/server/wm/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v4

    .line 246
    :try_start_0
    invoke-virtual {p0}, Lcom/android/server/wm/MoveWindowService;->initWinListToMovedLocked()V

    .line 247
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    if-nez v3, :cond_1

    .line 248
    const-string v3, "Move_Win"

    const-string v5, "no focus win, should not init"

    invoke-static {v3, v5}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    monitor-exit v4

    goto :goto_0

    .line 280
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 251
    :cond_1
    :try_start_1
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->mRealWindowManager:Lcom/android/server/wm/WindowManagerService;

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Lcom/android/server/wm/WindowManagerService;->getDisplayContentLocked(I)Lcom/android/server/wm/DisplayContent;

    move-result-object v0

    .line 252
    .local v0, "displayContent":Lcom/android/server/wm/DisplayContent;
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    if-eqz v3, :cond_2

    .line 253
    iget v3, v0, Lcom/android/server/wm/DisplayContent;->pendingLayoutChanges:I

    or-int/lit8 v3, v3, 0x4

    iput v3, v0, Lcom/android/server/wm/DisplayContent;->pendingLayoutChanges:I

    .line 255
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    iget-object v5, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    iget-object v5, v5, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v5, v5, Landroid/view/WindowManager$LayoutParams;->flags:I

    invoke-virtual {v3, v5}, Lcom/android/server/wm/WindowState;->setBackupFlag(I)V

    .line 256
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    iget-object v3, v3, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v5, v3, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/high16 v6, 0x100000

    or-int/2addr v5, v6

    iput v5, v3, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 257
    const/4 v3, 0x1

    iput-boolean v3, v0, Lcom/android/server/wm/DisplayContent;->layoutNeeded:Z

    .line 259
    :cond_2
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->mRealWindowManager:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v3, Lcom/android/server/wm/WindowManagerService;->mInputMethodManager:Lcom/android/internal/view/IInputMethodManager;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v3, :cond_3

    .line 262
    :try_start_2
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->mRealWindowManager:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v3, Lcom/android/server/wm/WindowManagerService;->mCurrentFocus:Lcom/android/server/wm/WindowState;

    if-eqz v3, :cond_3

    invoke-direct {p0}, Lcom/android/server/wm/MoveWindowService;->getMzIInputMethodManager()Lcom/android/internal/view/MzIInputMethodManager;

    move-result-object v3

    invoke-interface {v3}, Lcom/android/internal/view/MzIInputMethodManager;->mzIsShown()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 263
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->mRealWindowManager:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v3, Lcom/android/server/wm/WindowManagerService;->mInputMethodManager:Lcom/android/internal/view/IInputMethodManager;

    iget-object v5, p0, Lcom/android/server/wm/MoveWindowService;->mRealWindowManager:Lcom/android/server/wm/WindowManagerService;

    iget-object v5, v5, Lcom/android/server/wm/WindowManagerService;->mCurrentFocus:Lcom/android/server/wm/WindowState;

    iget-object v5, v5, Lcom/android/server/wm/WindowState;->mSession:Lcom/android/server/wm/Session;

    iget-object v5, v5, Lcom/android/server/wm/Session;->mClient:Lcom/android/internal/view/IInputMethodClient;

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-interface {v3, v5, v6, v7}, Lcom/android/internal/view/IInputMethodManager;->hideSoftInput(Lcom/android/internal/view/IInputMethodClient;ILandroid/os/ResultReceiver;)Z
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 268
    :cond_3
    :goto_1
    :try_start_3
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedWinList:Lcom/android/server/wm/WindowList;

    if-eqz v3, :cond_6

    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedWinList:Lcom/android/server/wm/WindowList;

    invoke-virtual {v3}, Lcom/android/server/wm/WindowList;->size()I

    move-result v3

    if-lez v3, :cond_6

    .line 269
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedWinList:Lcom/android/server/wm/WindowList;

    invoke-virtual {v3}, Lcom/android/server/wm/WindowList;->size()I

    move-result v3

    add-int/lit8 v1, v3, -0x1

    .local v1, "i":I
    :goto_2
    if-ltz v1, :cond_5

    .line 270
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedWinList:Lcom/android/server/wm/WindowList;

    invoke-virtual {v3, v1}, Lcom/android/server/wm/WindowList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/wm/WindowState;

    .line 271
    .local v2, "ws":Lcom/android/server/wm/WindowState;
    if-eqz v2, :cond_4

    .line 272
    iget-object v3, v2, Lcom/android/server/wm/WindowState;->mWindowStateExt:Lcom/android/server/wm/WindowStateExt;

    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Lcom/android/server/wm/WindowStateExt;->setIsInMovedMode(Z)V

    .line 273
    iget-object v3, v2, Lcom/android/server/wm/WindowState;->mWindowStateExt:Lcom/android/server/wm/WindowStateExt;

    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Lcom/android/server/wm/WindowStateExt;->setIsMovingFinished(Z)V

    .line 274
    iget-object v3, v2, Lcom/android/server/wm/WindowState;->mWindowStateExt:Lcom/android/server/wm/WindowStateExt;

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Lcom/android/server/wm/WindowStateExt;->setMovedX(I)V

    .line 275
    iget-object v3, v2, Lcom/android/server/wm/WindowState;->mWindowStateExt:Lcom/android/server/wm/WindowStateExt;

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Lcom/android/server/wm/WindowStateExt;->setMovedY(I)V

    .line 269
    :cond_4
    add-int/lit8 v1, v1, -0x1

    goto :goto_2

    .line 278
    .end local v2    # "ws":Lcom/android/server/wm/WindowState;
    :cond_5
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->mRealWindowManager:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v3}, Lcom/android/server/wm/WindowManagerService;->performLayoutAndPlaceSurfacesForMoveWinLocked()V

    .line 280
    .end local v1    # "i":I
    :cond_6
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_0

    .line 264
    :catch_0
    move-exception v3

    goto :goto_1
.end method

.method private moveTopAppShowFrame(II)V
    .locals 6
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 309
    iget-object v2, p0, Lcom/android/server/wm/MoveWindowService;->mRealWindowManager:Lcom/android/server/wm/WindowManagerService;

    iget-object v3, v2, Lcom/android/server/wm/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v3

    .line 310
    :try_start_0
    iget-object v2, p0, Lcom/android/server/wm/MoveWindowService;->movedWinList:Lcom/android/server/wm/WindowList;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/android/server/wm/MoveWindowService;->movedWinList:Lcom/android/server/wm/WindowList;

    invoke-virtual {v2}, Lcom/android/server/wm/WindowList;->size()I

    move-result v2

    if-lez v2, :cond_2

    iget-object v2, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    invoke-virtual {v2}, Lcom/android/server/wm/WindowState;->isInMovedMode()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 311
    iget-object v2, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    iget-object v2, v2, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v4, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/high16 v5, 0x4000000

    or-int/2addr v4, v5

    iput v4, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 312
    iget-object v2, p0, Lcom/android/server/wm/MoveWindowService;->movedWinList:Lcom/android/server/wm/WindowList;

    invoke-virtual {v2}, Lcom/android/server/wm/WindowList;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_1

    .line 313
    iget-object v2, p0, Lcom/android/server/wm/MoveWindowService;->movedWinList:Lcom/android/server/wm/WindowList;

    invoke-virtual {v2, v0}, Lcom/android/server/wm/WindowList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/wm/WindowState;

    .line 314
    .local v1, "ws":Lcom/android/server/wm/WindowState;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/android/server/wm/WindowState;->isInMovedMode()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 315
    iget-object v2, v1, Lcom/android/server/wm/WindowState;->mWindowStateExt:Lcom/android/server/wm/WindowStateExt;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Lcom/android/server/wm/WindowStateExt;->setIsMovingFinished(Z)V

    .line 316
    iget-object v2, v1, Lcom/android/server/wm/WindowState;->mWindowStateExt:Lcom/android/server/wm/WindowStateExt;

    invoke-virtual {v2, p1}, Lcom/android/server/wm/WindowStateExt;->setMovedX(I)V

    .line 317
    iget-object v2, v1, Lcom/android/server/wm/WindowState;->mWindowStateExt:Lcom/android/server/wm/WindowStateExt;

    invoke-virtual {v2, p2}, Lcom/android/server/wm/WindowStateExt;->setMovedY(I)V

    .line 312
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 320
    .end local v1    # "ws":Lcom/android/server/wm/WindowState;
    :cond_1
    iget-object v2, p0, Lcom/android/server/wm/MoveWindowService;->mRealWindowManager:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v2}, Lcom/android/server/wm/WindowManagerService;->scheduleAnimationLocked()V

    .line 322
    .end local v0    # "i":I
    :cond_2
    monitor-exit v3

    .line 323
    return-void

    .line 322
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method private moveTopAppWinFrame()V
    .locals 6

    .prologue
    .line 291
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->mRealWindowManager:Lcom/android/server/wm/WindowManagerService;

    iget-object v4, v3, Lcom/android/server/wm/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v4

    .line 292
    :try_start_0
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->mRealWindowManager:Lcom/android/server/wm/WindowManagerService;

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Lcom/android/server/wm/WindowManagerService;->getDisplayContentLocked(I)Lcom/android/server/wm/DisplayContent;

    move-result-object v0

    .line 293
    .local v0, "displayContent":Lcom/android/server/wm/DisplayContent;
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedWinList:Lcom/android/server/wm/WindowList;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedWinList:Lcom/android/server/wm/WindowList;

    invoke-virtual {v3}, Lcom/android/server/wm/WindowList;->size()I

    move-result v3

    if-lez v3, :cond_1

    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    invoke-virtual {v3}, Lcom/android/server/wm/WindowState;->isInMovedMode()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 294
    const/4 v3, 0x1

    iput-boolean v3, v0, Lcom/android/server/wm/DisplayContent;->layoutNeeded:Z

    .line 295
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->mRealWindowManager:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v3}, Lcom/android/server/wm/WindowManagerService;->requestTraversalLocked()V

    .line 296
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedWinList:Lcom/android/server/wm/WindowList;

    invoke-virtual {v3}, Lcom/android/server/wm/WindowList;->size()I

    move-result v3

    add-int/lit8 v1, v3, -0x1

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_1

    .line 297
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedWinList:Lcom/android/server/wm/WindowList;

    invoke-virtual {v3, v1}, Lcom/android/server/wm/WindowList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/wm/WindowState;

    .line 298
    .local v2, "ws":Lcom/android/server/wm/WindowState;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/android/server/wm/WindowState;->isInMovedMode()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 299
    iget-object v3, v2, Lcom/android/server/wm/WindowState;->mWindowStateExt:Lcom/android/server/wm/WindowStateExt;

    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Lcom/android/server/wm/WindowStateExt;->setIsMovingFinished(Z)V

    .line 296
    :cond_0
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 303
    .end local v1    # "i":I
    .end local v2    # "ws":Lcom/android/server/wm/WindowState;
    :cond_1
    monitor-exit v4

    .line 304
    return-void

    .line 303
    .end local v0    # "displayContent":Lcom/android/server/wm/DisplayContent;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method

.method private moveWinDown(I)V
    .locals 4
    .param p1, "duration"    # I

    .prologue
    .line 97
    iget-object v0, p0, Lcom/android/server/wm/MoveWindowService;->windowDownAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    .line 98
    iget-object v0, p0, Lcom/android/server/wm/MoveWindowService;->windowDownAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 101
    :cond_0
    invoke-direct {p0}, Lcom/android/server/wm/MoveWindowService;->initMoveWinMode()V

    .line 103
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    int-to-long v2, p1

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/wm/MoveWindowService;->windowDownAnimator:Landroid/animation/ValueAnimator;

    .line 104
    iget-object v0, p0, Lcom/android/server/wm/MoveWindowService;->windowDownAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 105
    iget-object v0, p0, Lcom/android/server/wm/MoveWindowService;->windowDownAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/android/server/wm/MoveWindowService$2;

    invoke-direct {v1, p0}, Lcom/android/server/wm/MoveWindowService$2;-><init>(Lcom/android/server/wm/MoveWindowService;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 119
    iget-object v0, p0, Lcom/android/server/wm/MoveWindowService;->windowDownAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/android/server/wm/MoveWindowService$3;

    invoke-direct {v1, p0}, Lcom/android/server/wm/MoveWindowService$3;-><init>(Lcom/android/server/wm/MoveWindowService;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 140
    iget-object v0, p0, Lcom/android/server/wm/MoveWindowService;->windowDownAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 141
    return-void

    .line 103
    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private moveWinNormal(I)V
    .locals 4
    .param p1, "duration"    # I

    .prologue
    .line 145
    iget-object v0, p0, Lcom/android/server/wm/MoveWindowService;->windowDownAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    .line 146
    iget-object v0, p0, Lcom/android/server/wm/MoveWindowService;->windowDownAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 149
    :cond_0
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    int-to-long v2, p1

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/wm/MoveWindowService;->windowDownAnimator:Landroid/animation/ValueAnimator;

    .line 150
    iget-object v0, p0, Lcom/android/server/wm/MoveWindowService;->windowDownAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 151
    iget-object v0, p0, Lcom/android/server/wm/MoveWindowService;->windowDownAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/android/server/wm/MoveWindowService$4;

    invoke-direct {v1, p0}, Lcom/android/server/wm/MoveWindowService$4;-><init>(Lcom/android/server/wm/MoveWindowService;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 165
    iget-object v0, p0, Lcom/android/server/wm/MoveWindowService;->windowDownAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/android/server/wm/MoveWindowService$5;

    invoke-direct {v1, p0}, Lcom/android/server/wm/MoveWindowService$5;-><init>(Lcom/android/server/wm/MoveWindowService;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 186
    iget-object v0, p0, Lcom/android/server/wm/MoveWindowService;->windowDownAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 187
    return-void

    .line 149
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private resetMoveWinMode()V
    .locals 6

    .prologue
    .line 329
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->mRealWindowManager:Lcom/android/server/wm/WindowManagerService;

    iget-object v4, v3, Lcom/android/server/wm/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v4

    .line 331
    :try_start_0
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->mRealWindowManager:Lcom/android/server/wm/WindowManagerService;

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Lcom/android/server/wm/WindowManagerService;->getDisplayContentLocked(I)Lcom/android/server/wm/DisplayContent;

    move-result-object v0

    .line 332
    .local v0, "displayContent":Lcom/android/server/wm/DisplayContent;
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedWinList:Lcom/android/server/wm/WindowList;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedWinList:Lcom/android/server/wm/WindowList;

    invoke-virtual {v3}, Lcom/android/server/wm/WindowList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    .line 333
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedWinList:Lcom/android/server/wm/WindowList;

    invoke-virtual {v3}, Lcom/android/server/wm/WindowList;->size()I

    move-result v3

    add-int/lit8 v1, v3, -0x1

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_0

    .line 334
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedWinList:Lcom/android/server/wm/WindowList;

    invoke-virtual {v3, v1}, Lcom/android/server/wm/WindowList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/wm/WindowState;

    .line 335
    .local v2, "ws":Lcom/android/server/wm/WindowState;
    iget-object v3, v2, Lcom/android/server/wm/WindowState;->mWindowStateExt:Lcom/android/server/wm/WindowStateExt;

    invoke-virtual {v3}, Lcom/android/server/wm/WindowStateExt;->resetMoveWin()V

    .line 333
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 337
    .end local v2    # "ws":Lcom/android/server/wm/WindowState;
    :cond_0
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    invoke-virtual {v3}, Lcom/android/server/wm/WindowState;->isInMovedMode()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 338
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    iget-object v3, v3, Lcom/android/server/wm/WindowState;->mWindowStateExt:Lcom/android/server/wm/WindowStateExt;

    invoke-virtual {v3}, Lcom/android/server/wm/WindowStateExt;->resetMoveWin()V

    .line 340
    :cond_1
    iget v3, v0, Lcom/android/server/wm/DisplayContent;->pendingLayoutChanges:I

    or-int/lit8 v3, v3, 0x4

    iput v3, v0, Lcom/android/server/wm/DisplayContent;->pendingLayoutChanges:I

    .line 341
    const/4 v3, 0x1

    iput-boolean v3, v0, Lcom/android/server/wm/DisplayContent;->layoutNeeded:Z

    .line 342
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->mRealWindowManager:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v3}, Lcom/android/server/wm/WindowManagerService;->performLayoutAndPlaceSurfacesForMoveWinLocked()V

    .line 343
    const/4 v3, 0x1

    const/4 v5, 0x0

    invoke-virtual {p0, v3, v5}, Lcom/android/server/wm/MoveWindowService;->notifyMoveWinClient(II)V

    .line 345
    .end local v1    # "i":I
    :cond_2
    monitor-exit v4

    .line 346
    return-void

    .line 345
    .end local v0    # "displayContent":Lcom/android/server/wm/DisplayContent;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method


# virtual methods
.method adjustBackupWindowFlag(Lcom/android/server/wm/WindowState;Landroid/view/WindowManager$LayoutParams;)V
    .locals 1
    .param p1, "win"    # Lcom/android/server/wm/WindowState;
    .param p2, "attrs"    # Landroid/view/WindowManager$LayoutParams;

    .prologue
    .line 441
    iget-object v0, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/android/server/wm/WindowState;->isInMovedMode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 442
    iget v0, p2, Landroid/view/WindowManager$LayoutParams;->flags:I

    invoke-virtual {p1, v0}, Lcom/android/server/wm/WindowState;->setBackupFlag(I)V

    .line 443
    :cond_0
    return-void
.end method

.method adjustInputWindow(Lcom/android/server/wm/WindowState;I)V
    .locals 2
    .param p1, "win"    # Lcom/android/server/wm/WindowState;
    .param p2, "viewVisibility"    # I

    .prologue
    const/16 v1, 0x7db

    .line 447
    if-nez p2, :cond_1

    iget-object v0, p1, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->type:I

    if-ne v0, v1, :cond_1

    .line 448
    const/4 v0, 0x2

    iget-object v1, p1, Lcom/android/server/wm/WindowState;->mVisibleFrame:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    invoke-virtual {p0, v0, v1}, Lcom/android/server/wm/MoveWindowService;->notifyMoveWinClient(II)V

    .line 453
    :cond_0
    :goto_0
    return-void

    .line 449
    :cond_1
    const/16 v0, 0x8

    if-ne p2, v0, :cond_0

    iget-object v0, p1, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->type:I

    if-ne v0, v1, :cond_0

    .line 450
    const/4 v0, 0x3

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/server/wm/MoveWindowService;->notifyMoveWinClient(II)V

    goto :goto_0
.end method

.method adjustOnOrientationChanged(Lcom/android/server/wm/DisplayContent;)V
    .locals 4
    .param p1, "displayContent"    # Lcom/android/server/wm/DisplayContent;

    .prologue
    const/4 v3, 0x1

    .line 456
    iget-object v2, p0, Lcom/android/server/wm/MoveWindowService;->movedWinList:Lcom/android/server/wm/WindowList;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/android/server/wm/MoveWindowService;->movedWinList:Lcom/android/server/wm/WindowList;

    invoke-virtual {v2}, Lcom/android/server/wm/WindowList;->size()I

    move-result v2

    if-lez v2, :cond_1

    iget-object v2, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    invoke-virtual {v2}, Lcom/android/server/wm/WindowState;->isInMovedMode()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 457
    iget-object v2, p0, Lcom/android/server/wm/MoveWindowService;->movedWinList:Lcom/android/server/wm/WindowList;

    invoke-virtual {v2}, Lcom/android/server/wm/WindowList;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_0

    .line 458
    iget-object v2, p0, Lcom/android/server/wm/MoveWindowService;->movedWinList:Lcom/android/server/wm/WindowList;

    invoke-virtual {v2, v0}, Lcom/android/server/wm/WindowList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/wm/WindowState;

    .line 459
    .local v1, "ws":Lcom/android/server/wm/WindowState;
    iget-object v2, v1, Lcom/android/server/wm/WindowState;->mWindowStateExt:Lcom/android/server/wm/WindowStateExt;

    invoke-virtual {v2}, Lcom/android/server/wm/WindowStateExt;->resetMoveWin()V

    .line 457
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 462
    .end local v1    # "ws":Lcom/android/server/wm/WindowState;
    :cond_0
    iget v2, p1, Lcom/android/server/wm/DisplayContent;->pendingLayoutChanges:I

    or-int/lit8 v2, v2, 0x4

    iput v2, p1, Lcom/android/server/wm/DisplayContent;->pendingLayoutChanges:I

    .line 463
    iput-boolean v3, p1, Lcom/android/server/wm/DisplayContent;->layoutNeeded:Z

    .line 464
    const/4 v2, 0x0

    invoke-virtual {p0, v3, v2}, Lcom/android/server/wm/MoveWindowService;->notifyMoveWinClient(II)V

    .line 466
    .end local v0    # "i":I
    :cond_1
    return-void
.end method

.method adjustWallpaperMoveWindow(Lcom/android/server/wm/WindowState;)V
    .locals 3
    .param p1, "w"    # Lcom/android/server/wm/WindowState;

    .prologue
    .line 405
    iget-object v0, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/android/server/wm/WindowState;->mWindowStateExt:Lcom/android/server/wm/WindowStateExt;

    invoke-virtual {v0}, Lcom/android/server/wm/WindowStateExt;->isInMovedMode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 406
    iget-object v0, p1, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/high16 v2, 0x100000

    or-int/2addr v1, v2

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 408
    :cond_0
    return-void
.end method

.method public getMovedWinPoint()Landroid/graphics/Point;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 216
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->mRealWindowManager:Lcom/android/server/wm/WindowManagerService;

    iget-object v4, v3, Lcom/android/server/wm/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v4

    .line 217
    const/4 v1, 0x0

    .line 218
    .local v1, "x":I
    const/4 v2, 0x0

    .line 219
    .local v2, "y":I
    :try_start_0
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 220
    .local v0, "p":Landroid/graphics/Point;
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    if-eqz v3, :cond_0

    .line 221
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    iget-object v3, v3, Lcom/android/server/wm/WindowState;->mWindowStateExt:Lcom/android/server/wm/WindowStateExt;

    invoke-virtual {v3}, Lcom/android/server/wm/WindowStateExt;->getMovedX()I

    move-result v1

    .line 222
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    iget-object v3, v3, Lcom/android/server/wm/WindowState;->mWindowStateExt:Lcom/android/server/wm/WindowStateExt;

    invoke-virtual {v3}, Lcom/android/server/wm/WindowStateExt;->getMovedY()I

    move-result v2

    .line 224
    :cond_0
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Point;->set(II)V

    .line 225
    monitor-exit v4

    return-object v0

    .line 226
    .end local v0    # "p":Landroid/graphics/Point;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method

.method public initWinListToMovedLocked()V
    .locals 6

    .prologue
    .line 368
    iget-object v4, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    invoke-virtual {v4}, Lcom/android/server/wm/WindowState;->isInMovedMode()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 400
    :cond_0
    return-void

    .line 372
    :cond_1
    iget-object v4, p0, Lcom/android/server/wm/MoveWindowService;->mRealWindowManager:Lcom/android/server/wm/WindowManagerService;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/android/server/wm/WindowManagerService;->getDisplayContentLocked(I)Lcom/android/server/wm/DisplayContent;

    move-result-object v0

    .line 373
    .local v0, "displayContent":Lcom/android/server/wm/DisplayContent;
    invoke-virtual {v0}, Lcom/android/server/wm/DisplayContent;->getWindowList()Lcom/android/server/wm/WindowList;

    move-result-object v3

    .line 376
    .local v3, "windows":Lcom/android/server/wm/WindowList;
    invoke-virtual {v3}, Lcom/android/server/wm/WindowList;->size()I

    move-result v4

    add-int/lit8 v1, v4, -0x1

    .local v1, "j":I
    :goto_0
    if-ltz v1, :cond_0

    .line 377
    invoke-virtual {v3, v1}, Lcom/android/server/wm/WindowList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/wm/WindowState;

    .line 387
    .local v2, "win":Lcom/android/server/wm/WindowState;
    iget-object v4, v2, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v4, v4, Landroid/view/WindowManager$LayoutParams;->type:I

    const/16 v5, 0x7dd

    if-eq v4, v5, :cond_3

    iget-object v4, v2, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v4, v4, Landroid/view/WindowManager$LayoutParams;->type:I

    const/16 v5, 0x7db

    if-eq v4, v5, :cond_3

    iget-object v4, v2, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v4, v4, Landroid/view/WindowManager$LayoutParams;->type:I

    const/16 v5, 0x7d4

    if-eq v4, v5, :cond_3

    const-string v4, "com.android.systemui"

    invoke-virtual {v2}, Lcom/android/server/wm/WindowState;->getOwningPackage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    iget-boolean v4, v2, Lcom/android/server/wm/WindowState;->mHasSurface:Z

    if-eqz v4, :cond_3

    iget-object v4, v2, Lcom/android/server/wm/WindowState;->mAttachedWindow:Lcom/android/server/wm/WindowState;

    if-nez v4, :cond_3

    .line 394
    iget-object v4, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    if-nez v4, :cond_2

    iget-object v4, v2, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v4, v4, Landroid/view/WindowManager$LayoutParams;->type:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_2

    .line 395
    iput-object v2, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    .line 397
    :cond_2
    iget-object v4, p0, Lcom/android/server/wm/MoveWindowService;->movedWinList:Lcom/android/server/wm/WindowList;

    invoke-virtual {v4, v2}, Lcom/android/server/wm/WindowList;->add(Ljava/lang/Object;)Z

    .line 376
    :cond_3
    add-int/lit8 v1, v1, -0x1

    goto :goto_0
.end method

.method public moveTopAppWindow(III)V
    .locals 0
    .param p1, "mode"    # I
    .param p2, "x"    # I
    .param p3, "y"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 193
    packed-switch p1, :pswitch_data_0

    .line 210
    :pswitch_0
    return-void

    .line 193
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public moveWindow(II)Z
    .locals 2
    .param p1, "cmd"    # I
    .param p2, "durationTime"    # I

    .prologue
    .line 74
    iget-object v0, p0, Lcom/android/server/wm/MoveWindowService;->mH:Landroid/os/Handler;

    new-instance v1, Lcom/android/server/wm/MoveWindowService$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/android/server/wm/MoveWindowService$1;-><init>(Lcom/android/server/wm/MoveWindowService;II)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 91
    const/4 v0, 0x1

    return v0
.end method

.method public notifyMoveWinClient(II)V
    .locals 1
    .param p1, "msg"    # I
    .param p2, "data"    # I

    .prologue
    .line 349
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 350
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    .line 351
    iget-object v0, p0, Lcom/android/server/wm/MoveWindowService;->movedWinList:Lcom/android/server/wm/WindowList;

    if-eqz v0, :cond_0

    .line 352
    iget-object v0, p0, Lcom/android/server/wm/MoveWindowService;->movedWinList:Lcom/android/server/wm/WindowList;

    invoke-virtual {v0}, Lcom/android/server/wm/WindowList;->clear()V

    .line 356
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/android/server/wm/MoveWindowService;->mMWCb:Lmeizu/view/IMoveWinCallback;

    if-eqz v0, :cond_1

    .line 357
    iget-object v0, p0, Lcom/android/server/wm/MoveWindowService;->mMWCb:Lmeizu/view/IMoveWinCallback;

    invoke-interface {v0, p1, p2}, Lmeizu/view/IMoveWinCallback;->notifyClient(II)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 362
    :cond_1
    :goto_0
    return-void

    .line 359
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public processInputEvent(Landroid/view/InputEvent;)V
    .locals 11
    .param p1, "event"    # Landroid/view/InputEvent;

    .prologue
    const/4 v10, 0x0

    .line 492
    instance-of v8, p1, Landroid/view/MotionEvent;

    if-eqz v8, :cond_0

    .line 493
    iget-object v8, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    if-eqz v8, :cond_0

    iget-object v8, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    invoke-virtual {v8}, Lcom/android/server/wm/WindowState;->isInMovedMode()Z

    move-result v8

    if-eqz v8, :cond_0

    move-object v5, p1

    .line 494
    check-cast v5, Landroid/view/MotionEvent;

    .line 495
    .local v5, "motionEvent":Landroid/view/MotionEvent;
    new-instance v6, Landroid/graphics/Point;

    invoke-direct {v6}, Landroid/graphics/Point;-><init>()V

    .line 498
    .local v6, "point":Landroid/graphics/Point;
    iget-object v8, p0, Lcom/android/server/wm/MoveWindowService;->mRealWindowManager:Lcom/android/server/wm/WindowManagerService;

    iget-object v9, v8, Lcom/android/server/wm/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v9

    .line 500
    :try_start_0
    iget-object v8, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    if-nez v8, :cond_1

    .line 501
    monitor-exit v9

    .line 526
    .end local v5    # "motionEvent":Landroid/view/MotionEvent;
    .end local v6    # "point":Landroid/graphics/Point;
    :cond_0
    :goto_0
    return-void

    .line 503
    .restart local v5    # "motionEvent":Landroid/view/MotionEvent;
    .restart local v6    # "point":Landroid/graphics/Point;
    :cond_1
    iget-object v8, p0, Lcom/android/server/wm/MoveWindowService;->mRealWindowManager:Lcom/android/server/wm/WindowManagerService;

    invoke-virtual {v8}, Lcom/android/server/wm/WindowManagerService;->getDefaultDisplayContentLocked()Lcom/android/server/wm/DisplayContent;

    move-result-object v3

    .line 504
    .local v3, "displayContent":Lcom/android/server/wm/DisplayContent;
    invoke-virtual {v3}, Lcom/android/server/wm/DisplayContent;->getDisplay()Landroid/view/Display;

    move-result-object v2

    .line 505
    .local v2, "display":Landroid/view/Display;
    monitor-exit v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 506
    invoke-virtual {v2, v6}, Landroid/view/Display;->getRealSize(Landroid/graphics/Point;)V

    .line 507
    iget v7, v6, Landroid/graphics/Point;->x:I

    .line 508
    .local v7, "width":I
    iget v4, v6, Landroid/graphics/Point;->y:I

    .line 509
    .local v4, "height":I
    invoke-static {v7, v4}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 510
    .local v0, "deviceHeight":I
    invoke-static {v7, v4}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 512
    .local v1, "deviceWidth":I
    if-eqz v6, :cond_0

    invoke-virtual {v5}, Landroid/view/MotionEvent;->getRawX()F

    move-result v8

    iget-object v9, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    iget-object v9, v9, Lcom/android/server/wm/WindowState;->mWindowStateExt:Lcom/android/server/wm/WindowStateExt;

    invoke-virtual {v9}, Lcom/android/server/wm/WindowStateExt;->getMovedX()I

    move-result v9

    int-to-float v9, v9

    cmpg-float v8, v8, v9

    if-gez v8, :cond_2

    invoke-virtual {v5}, Landroid/view/MotionEvent;->getRawX()F

    move-result v8

    cmpl-float v8, v8, v10

    if-gtz v8, :cond_5

    :cond_2
    invoke-virtual {v5}, Landroid/view/MotionEvent;->getRawY()F

    move-result v8

    iget-object v9, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    iget-object v9, v9, Lcom/android/server/wm/WindowState;->mWindowStateExt:Lcom/android/server/wm/WindowStateExt;

    invoke-virtual {v9}, Lcom/android/server/wm/WindowStateExt;->getMovedY()I

    move-result v9

    int-to-float v9, v9

    cmpg-float v8, v8, v9

    if-gez v8, :cond_3

    invoke-virtual {v5}, Landroid/view/MotionEvent;->getRawY()F

    move-result v8

    cmpl-float v8, v8, v10

    if-gtz v8, :cond_5

    :cond_3
    invoke-virtual {v5}, Landroid/view/MotionEvent;->getRawX()F

    move-result v8

    iget-object v9, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    iget-object v9, v9, Lcom/android/server/wm/WindowState;->mWindowStateExt:Lcom/android/server/wm/WindowStateExt;

    invoke-virtual {v9}, Lcom/android/server/wm/WindowStateExt;->getMovedX()I

    move-result v9

    add-int/2addr v9, v1

    int-to-float v9, v9

    cmpl-float v8, v8, v9

    if-lez v8, :cond_4

    invoke-virtual {v5}, Landroid/view/MotionEvent;->getRawX()F

    move-result v8

    int-to-float v9, v1

    cmpg-float v8, v8, v9

    if-ltz v8, :cond_5

    :cond_4
    invoke-virtual {v5}, Landroid/view/MotionEvent;->getRawY()F

    move-result v8

    iget-object v9, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    iget-object v9, v9, Lcom/android/server/wm/WindowState;->mWindowStateExt:Lcom/android/server/wm/WindowStateExt;

    invoke-virtual {v9}, Lcom/android/server/wm/WindowStateExt;->getMovedY()I

    move-result v9

    add-int/2addr v9, v0

    int-to-float v9, v9

    cmpl-float v8, v8, v9

    if-lez v8, :cond_0

    invoke-virtual {v5}, Landroid/view/MotionEvent;->getRawY()F

    move-result v8

    int-to-float v9, v0

    cmpg-float v8, v8, v9

    if-gez v8, :cond_0

    .line 517
    :cond_5
    iget-object v8, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    iget-object v8, v8, Lcom/android/server/wm/WindowState;->mWindowStateExt:Lcom/android/server/wm/WindowStateExt;

    invoke-virtual {v8}, Lcom/android/server/wm/WindowStateExt;->isMovingFinished()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 520
    invoke-virtual {v5}, Landroid/view/MotionEvent;->getAction()I

    move-result v8

    if-nez v8, :cond_0

    .line 521
    const/4 v8, 0x0

    const/16 v9, 0x15e

    invoke-virtual {p0, v8, v9}, Lcom/android/server/wm/MoveWindowService;->moveWindow(II)Z

    goto/16 :goto_0

    .line 505
    .end local v0    # "deviceHeight":I
    .end local v1    # "deviceWidth":I
    .end local v2    # "display":Landroid/view/Display;
    .end local v3    # "displayContent":Lcom/android/server/wm/DisplayContent;
    .end local v4    # "height":I
    .end local v7    # "width":I
    :catchall_0
    move-exception v8

    :try_start_1
    monitor-exit v9
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v8
.end method

.method resetOnWindowChanged(ILcom/android/server/wm/WindowState;)V
    .locals 5
    .param p1, "viewVisibility"    # I
    .param p2, "win"    # Lcom/android/server/wm/WindowState;

    .prologue
    const/4 v4, 0x0

    .line 414
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    if-eqz v3, :cond_4

    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    invoke-virtual {v3}, Lcom/android/server/wm/WindowState;->isInMovedMode()Z

    move-result v3

    if-eqz v3, :cond_4

    if-nez p1, :cond_4

    .line 415
    const/4 v1, 0x0

    .line 416
    .local v1, "type":I
    if-eqz p2, :cond_0

    iget-object v3, p2, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    if-eqz v3, :cond_0

    .line 417
    iget-object v3, p2, Lcom/android/server/wm/WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v1, v3, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 418
    :cond_0
    const/4 v3, 0x3

    if-le v1, v3, :cond_1

    const/16 v3, 0x63

    if-lt v1, v3, :cond_3

    :cond_1
    const/16 v3, 0x3e8

    if-le v1, v3, :cond_2

    const/16 v3, 0x7cf

    if-lt v1, v3, :cond_3

    :cond_2
    const/4 v3, 0x2

    if-ne v1, v3, :cond_4

    .line 421
    :cond_3
    invoke-virtual {p0, v4, v4}, Lcom/android/server/wm/MoveWindowService;->notifyMoveWinClient(II)V

    .line 424
    .end local v1    # "type":I
    :cond_4
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    if-eqz v3, :cond_8

    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    invoke-virtual {v3}, Lcom/android/server/wm/WindowState;->isInMovedMode()Z

    move-result v3

    if-eqz v3, :cond_8

    const/16 v3, 0x8

    if-eq p1, v3, :cond_5

    const/4 v3, 0x4

    if-ne p1, v3, :cond_8

    .line 425
    :cond_5
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    invoke-virtual {v3, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedWinList:Lcom/android/server/wm/WindowList;

    if-eqz v3, :cond_8

    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedWinList:Lcom/android/server/wm/WindowList;

    invoke-virtual {v3}, Lcom/android/server/wm/WindowList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_8

    .line 426
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedWinList:Lcom/android/server/wm/WindowList;

    invoke-virtual {v3}, Lcom/android/server/wm/WindowList;->size()I

    move-result v3

    add-int/lit8 v0, v3, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_6

    .line 427
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedWinList:Lcom/android/server/wm/WindowList;

    invoke-virtual {v3, v0}, Lcom/android/server/wm/WindowList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/wm/WindowState;

    .line 428
    .local v2, "ws":Lcom/android/server/wm/WindowState;
    iget-object v3, v2, Lcom/android/server/wm/WindowState;->mWindowStateExt:Lcom/android/server/wm/WindowStateExt;

    invoke-virtual {v3}, Lcom/android/server/wm/WindowStateExt;->resetMoveWin()V

    .line 426
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 430
    .end local v2    # "ws":Lcom/android/server/wm/WindowState;
    :cond_6
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    if-eqz v3, :cond_7

    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    invoke-virtual {v3}, Lcom/android/server/wm/WindowState;->isInMovedMode()Z

    move-result v3

    if-eqz v3, :cond_7

    .line 431
    iget-object v3, p0, Lcom/android/server/wm/MoveWindowService;->movedFocusWin:Lcom/android/server/wm/WindowState;

    iget-object v3, v3, Lcom/android/server/wm/WindowState;->mWindowStateExt:Lcom/android/server/wm/WindowStateExt;

    invoke-virtual {v3}, Lcom/android/server/wm/WindowStateExt;->resetMoveWin()V

    .line 433
    :cond_7
    const/4 v3, 0x1

    invoke-virtual {p0, v3, v4}, Lcom/android/server/wm/MoveWindowService;->notifyMoveWinClient(II)V

    .line 436
    .end local v0    # "i":I
    :cond_8
    return-void
.end method

.method public setMoveWinListener(Lmeizu/view/IMoveWinCallback;)V
    .locals 0
    .param p1, "callback"    # Lmeizu/view/IMoveWinCallback;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 234
    iput-object p1, p0, Lcom/android/server/wm/MoveWindowService;->mMWCb:Lmeizu/view/IMoveWinCallback;

    .line 235
    return-void
.end method
