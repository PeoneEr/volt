module TasksHelper
  def edit_destroy_actions(task)
    links = []
    links << link_to(t('tasks.edit'), edit_my_task_path(task), class: 'btn btn-default')
    links << link_to(t('tasks.destroy'), my_task_path(task), method: :delete, data: { confirm: t('tasks.destroy_confirm') }, class: 'btn btn-danger')

    links.join.html_safe
  end

  def show_file(task)
    return unless task.file?

    image_tag task.file_url, class: 'img-responsive' if task.file_image?

    link_to t('tasks.download'), download_my_task_path(task)
  end
end
