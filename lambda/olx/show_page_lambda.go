package main

import (
	"context"
	"fmt"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
)

func HandleRequest(ctx context.Context, sqsEvent events.SQSEvent) {
	fmt.Println(sqsEvent.Records[0])
}

func main() {
	lambda.Start(HandleRequest)
}
