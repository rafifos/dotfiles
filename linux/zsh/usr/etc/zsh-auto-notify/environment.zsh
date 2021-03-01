# Configurations for zsh-auto-notify, a zsh plugin that automatically sends out a notification when a long running task
# has completed.
# @see: https://github.com/MichaelAquilina/zsh-auto-notify#configuration
export AUTO_NOTIFY_THRESHOLD=15
export AUTO_NOTIFY_TITLE='Hey! %command has just finished'
export AUTO_NOTIFY_BODY='It completed in %elapsed seconds with exit code %exit_code'
export AUTO_NOTIFY_EXPIRE_TIME=8192
export AUTO_NOTIFY_IGNORE=('docker' 'less' 'man' 'nvim' 'sleep')
