module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"

  cluster_name    = var.name
  cluster_version = "1.31"

  cluster_endpoint_public_access = true
  enable_cluster_creator_admin_permissions = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  cluster_addons = {
    vpc-cni = {
      most_recent    = true
      addon_version  = var.coredns_version
    }
    kube-proxy = {
      most_recent = true
    }
    coredns = {
      most_recent    = true
      addon_version  = var.coredns_version
    }
  }

  eks_managed_node_group_defaults = {
    instance_types                             = ["t2.micro"]
    attach_cluster_primary_security_group      = true
    iam_role_arn                               = aws_iam_role.example.arn 
  }

  eks_managed_node_groups = {
    tws-cluster-ng = {
      instance_types                            = ["t2.micro"]
      min_size                                  = 2
      max_size                                  = 3
      desired_size                              = 2
      capacity_type                             = "SPOT"
      on_demand_percentage_above_base_capacity  = 50
    }
  }

  tags = {
    Environment = var.env
    Terraform   = "true"
  }
}

