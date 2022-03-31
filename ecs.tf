# # Task Definition
# resource "aws_ecs_task_definition" "example" {
#     family = "example"

#     requires_compatibilities = ["FARGATE"]

#     cpu = "256"
#     memory = "512"

#     network_mode = "awsvpc"
# }