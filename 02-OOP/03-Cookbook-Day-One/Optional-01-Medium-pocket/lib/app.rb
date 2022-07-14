require_relative 'repo'    # You need to create this file!
require_relative 'controller'  # You need to create this file!
require_relative 'router'

csv_file   = File.join(__dir__, 'posts.csv')
repo   = Repo.new(csv_file)
controller = Controller.new(repo)

router = Router.new(controller)

# Start the app
router.run