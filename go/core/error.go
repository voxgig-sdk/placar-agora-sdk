package core

type PlacarAgoraError struct {
	IsPlacarAgoraError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewPlacarAgoraError(code string, msg string, ctx *Context) *PlacarAgoraError {
	return &PlacarAgoraError{
		IsPlacarAgoraError: true,
		Sdk:              "PlacarAgora",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *PlacarAgoraError) Error() string {
	return e.Msg
}
