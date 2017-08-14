module TasksHelper
  def edit_destroy_actions
    links = []
    links << link_to(t('tasks.edit'), edit_my_task(task), class: 'btn btn-default')
    links << link_to(t('tasks.destroy'), my_task(task), method: :delete, data: { confirm: t('tasks.destroy_confirm') }, class: 'btn btn-danger')

    links.join
  end

  def show_file(task)
    image_tag task.file_url, class: 'img-responsive' if task.file_image?

    link_to t('tasks.download'), download_my_task_path(task)
  end
end
