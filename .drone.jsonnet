{
  kind: "pipeline",
  name: "test-drone-yaml",
  steps: [
    {
      name: "drone jsonnet",
      image: "drone/cli:1.1.1-alpine",
      commands: [
        "sh test_drone_jsonnet_convert.sh",
      ],
      environment: {
        JSONNET_OPTS: "--format",
      },
    },
  ],
}
