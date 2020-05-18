// Code generated by protoc-gen-gogo. DO NOT EDIT.
// source: mixer/template/reportnothing/template_handler_service.proto

// The `reportnothing` template represents an empty block of data, which can be useful
// in different testing scenarios.
//
// Example config:
//
// ```yaml
// apiVersion: "config.istio.io/v1alpha2"
// kind: instance
// metadata:
//   name: reportrequest
//   namespace: istio-system
// spec:
//   compiledTemplate: reportnothing
// ```
//
// ReportNothing represents an empty block of data that is used for Report-capable
// adapters which don't require any parameters. This is primarily intended for testing
// scenarios.

package reportnothing

import (
	context "context"
	fmt "fmt"
	_ "github.com/gogo/protobuf/gogoproto"
	proto "github.com/gogo/protobuf/proto"
	types "github.com/gogo/protobuf/types"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
	io "io"
	v1beta1 "istio.io/api/mixer/adapter/model/v1beta1"
	math "math"
	math_bits "math/bits"
	reflect "reflect"
	strings "strings"
)

// Reference imports to suppress errors if they are not otherwise used.
var _ = proto.Marshal
var _ = fmt.Errorf
var _ = math.Inf

// This is a compile-time assertion to ensure that this generated file
// is compatible with the proto package it is being compiled against.
// A compilation error at this line likely means your copy of the
// proto package needs to be updated.
const _ = proto.GoGoProtoPackageIsVersion3 // please upgrade the proto package

// Request message for HandleReportNothing method.
type HandleReportNothingRequest struct {
	// 'reportnothing' instances.
	Instances []*InstanceMsg `protobuf:"bytes,1,rep,name=instances,proto3" json:"instances,omitempty"`
	// Adapter specific handler configuration.
	//
	// Note: Backends can also implement [InfrastructureBackend][https://istio.io/docs/reference/config/mixer/istio.mixer.adapter.model.v1beta1.html#InfrastructureBackend]
	// service and therefore opt to receive handler configuration during session creation through [InfrastructureBackend.CreateSession][TODO: Link to this fragment]
	// call. In that case, adapter_config will have type_url as 'google.protobuf.Any.type_url' and would contain string
	// value of session_id (returned from InfrastructureBackend.CreateSession).
	AdapterConfig *types.Any `protobuf:"bytes,2,opt,name=adapter_config,json=adapterConfig,proto3" json:"adapter_config,omitempty"`
	// Id to dedupe identical requests from Mixer.
	DedupId string `protobuf:"bytes,3,opt,name=dedup_id,json=dedupId,proto3" json:"dedup_id,omitempty"`
}

func (m *HandleReportNothingRequest) Reset()      { *m = HandleReportNothingRequest{} }
func (*HandleReportNothingRequest) ProtoMessage() {}
func (*HandleReportNothingRequest) Descriptor() ([]byte, []int) {
	return fileDescriptor_48543db908342022, []int{0}
}
func (m *HandleReportNothingRequest) XXX_Unmarshal(b []byte) error {
	return m.Unmarshal(b)
}
func (m *HandleReportNothingRequest) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	if deterministic {
		return xxx_messageInfo_HandleReportNothingRequest.Marshal(b, m, deterministic)
	} else {
		b = b[:cap(b)]
		n, err := m.MarshalToSizedBuffer(b)
		if err != nil {
			return nil, err
		}
		return b[:n], nil
	}
}
func (m *HandleReportNothingRequest) XXX_Merge(src proto.Message) {
	xxx_messageInfo_HandleReportNothingRequest.Merge(m, src)
}
func (m *HandleReportNothingRequest) XXX_Size() int {
	return m.Size()
}
func (m *HandleReportNothingRequest) XXX_DiscardUnknown() {
	xxx_messageInfo_HandleReportNothingRequest.DiscardUnknown(m)
}

var xxx_messageInfo_HandleReportNothingRequest proto.InternalMessageInfo

// Contains instance payload for 'reportnothing' template. This is passed to infrastructure backends during request-time
// through HandleReportNothingService.HandleReportNothing.
type InstanceMsg struct {
	// Name of the instance as specified in configuration.
	Name string `protobuf:"bytes,72295727,opt,name=name,proto3" json:"name,omitempty"`
}

func (m *InstanceMsg) Reset()      { *m = InstanceMsg{} }
func (*InstanceMsg) ProtoMessage() {}
func (*InstanceMsg) Descriptor() ([]byte, []int) {
	return fileDescriptor_48543db908342022, []int{1}
}
func (m *InstanceMsg) XXX_Unmarshal(b []byte) error {
	return m.Unmarshal(b)
}
func (m *InstanceMsg) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	if deterministic {
		return xxx_messageInfo_InstanceMsg.Marshal(b, m, deterministic)
	} else {
		b = b[:cap(b)]
		n, err := m.MarshalToSizedBuffer(b)
		if err != nil {
			return nil, err
		}
		return b[:n], nil
	}
}
func (m *InstanceMsg) XXX_Merge(src proto.Message) {
	xxx_messageInfo_InstanceMsg.Merge(m, src)
}
func (m *InstanceMsg) XXX_Size() int {
	return m.Size()
}
func (m *InstanceMsg) XXX_DiscardUnknown() {
	xxx_messageInfo_InstanceMsg.DiscardUnknown(m)
}

var xxx_messageInfo_InstanceMsg proto.InternalMessageInfo

// Contains inferred type information about specific instance of 'reportnothing' template. This is passed to
// infrastructure backends during configuration-time through [InfrastructureBackend.CreateSession][TODO: Link to this fragment].
type Type struct {
}

func (m *Type) Reset()      { *m = Type{} }
func (*Type) ProtoMessage() {}
func (*Type) Descriptor() ([]byte, []int) {
	return fileDescriptor_48543db908342022, []int{2}
}
func (m *Type) XXX_Unmarshal(b []byte) error {
	return m.Unmarshal(b)
}
func (m *Type) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	if deterministic {
		return xxx_messageInfo_Type.Marshal(b, m, deterministic)
	} else {
		b = b[:cap(b)]
		n, err := m.MarshalToSizedBuffer(b)
		if err != nil {
			return nil, err
		}
		return b[:n], nil
	}
}
func (m *Type) XXX_Merge(src proto.Message) {
	xxx_messageInfo_Type.Merge(m, src)
}
func (m *Type) XXX_Size() int {
	return m.Size()
}
func (m *Type) XXX_DiscardUnknown() {
	xxx_messageInfo_Type.DiscardUnknown(m)
}

var xxx_messageInfo_Type proto.InternalMessageInfo

// Represents instance configuration schema for 'reportnothing' template.
type InstanceParam struct {
}

func (m *InstanceParam) Reset()      { *m = InstanceParam{} }
func (*InstanceParam) ProtoMessage() {}
func (*InstanceParam) Descriptor() ([]byte, []int) {
	return fileDescriptor_48543db908342022, []int{3}
}
func (m *InstanceParam) XXX_Unmarshal(b []byte) error {
	return m.Unmarshal(b)
}
func (m *InstanceParam) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	if deterministic {
		return xxx_messageInfo_InstanceParam.Marshal(b, m, deterministic)
	} else {
		b = b[:cap(b)]
		n, err := m.MarshalToSizedBuffer(b)
		if err != nil {
			return nil, err
		}
		return b[:n], nil
	}
}
func (m *InstanceParam) XXX_Merge(src proto.Message) {
	xxx_messageInfo_InstanceParam.Merge(m, src)
}
func (m *InstanceParam) XXX_Size() int {
	return m.Size()
}
func (m *InstanceParam) XXX_DiscardUnknown() {
	xxx_messageInfo_InstanceParam.DiscardUnknown(m)
}

var xxx_messageInfo_InstanceParam proto.InternalMessageInfo

func init() {
	proto.RegisterType((*HandleReportNothingRequest)(nil), "reportnothing.HandleReportNothingRequest")
	proto.RegisterType((*InstanceMsg)(nil), "reportnothing.InstanceMsg")
	proto.RegisterType((*Type)(nil), "reportnothing.Type")
	proto.RegisterType((*InstanceParam)(nil), "reportnothing.InstanceParam")
}

func init() {
	proto.RegisterFile("mixer/template/reportnothing/template_handler_service.proto", fileDescriptor_48543db908342022)
}

var fileDescriptor_48543db908342022 = []byte{
	// 441 bytes of a gzipped FileDescriptorProto
	0x1f, 0x8b, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xff, 0x7c, 0x92, 0xb1, 0x6e, 0x13, 0x31,
	0x1c, 0xc6, 0xed, 0xb4, 0x2a, 0xd4, 0x51, 0x40, 0x3a, 0x8a, 0x94, 0xde, 0x60, 0x45, 0x27, 0x86,
	0x20, 0x21, 0x5b, 0x0d, 0x0b, 0x52, 0x27, 0x60, 0xa1, 0x03, 0x08, 0x0e, 0xf6, 0xc8, 0xc9, 0xfd,
	0x7b, 0xb5, 0x74, 0x67, 0x5f, 0x6d, 0xa7, 0x6a, 0x36, 0xc4, 0x0b, 0x80, 0xd4, 0x97, 0x60, 0x82,
	0x17, 0xe0, 0x01, 0x2a, 0xa6, 0x88, 0xa9, 0x0b, 0x12, 0xb9, 0x74, 0x60, 0xec, 0xc8, 0x88, 0xb0,
	0xaf, 0x40, 0x50, 0xe8, 0x76, 0x7f, 0x7f, 0xbf, 0xbb, 0xff, 0xf7, 0xf9, 0x3b, 0xb2, 0x5b, 0xca,
	0x63, 0x30, 0xdc, 0x41, 0x59, 0x15, 0xc2, 0x01, 0x37, 0x50, 0x69, 0xe3, 0x94, 0x76, 0x07, 0x52,
	0xe5, 0xbf, 0x8f, 0x87, 0x07, 0x42, 0x65, 0x05, 0x98, 0xa1, 0x05, 0x73, 0x24, 0xc7, 0xc0, 0x2a,
	0xa3, 0x9d, 0x8e, 0x3a, 0x4b, 0x74, 0xbc, 0x95, 0xeb, 0x5c, 0x7b, 0x85, 0xff, 0x7a, 0x0a, 0x50,
	0x7c, 0x2f, 0x6c, 0x10, 0x99, 0xa8, 0x1c, 0x18, 0x5e, 0xea, 0x0c, 0x0a, 0x7e, 0xb4, 0x33, 0x02,
	0x27, 0x76, 0x38, 0x1c, 0x3b, 0x50, 0x56, 0x6a, 0x65, 0x1b, 0x7a, 0x3b, 0xd7, 0x3a, 0x2f, 0x80,
	0xfb, 0x69, 0x34, 0xd9, 0xe7, 0x42, 0x4d, 0x1b, 0xa9, 0x7f, 0xd5, 0x87, 0x82, 0x93, 0x40, 0x26,
	0x1f, 0x30, 0x89, 0x9f, 0x78, 0xc7, 0xa9, 0x3f, 0x7e, 0x16, 0x0c, 0xa6, 0x70, 0x38, 0x01, 0xeb,
	0xa2, 0x07, 0x64, 0x53, 0x2a, 0xeb, 0x84, 0x1a, 0x83, 0xed, 0xe2, 0xde, 0x5a, 0xbf, 0x3d, 0x88,
	0xd9, 0x52, 0x14, 0xb6, 0xd7, 0xe8, 0x4f, 0x6d, 0x9e, 0xfe, 0x81, 0xa3, 0x5d, 0x72, 0xa3, 0x59,
	0x3f, 0x1c, 0x6b, 0xb5, 0x2f, 0xf3, 0x6e, 0xab, 0x87, 0xfb, 0xed, 0xc1, 0x16, 0x0b, 0xb6, 0xd9,
	0xa5, 0x6d, 0xf6, 0x50, 0x4d, 0xd3, 0x4e, 0xc3, 0x3e, 0xf6, 0x68, 0xb4, 0x4d, 0xae, 0x67, 0x90,
	0x4d, 0xaa, 0xa1, 0xcc, 0xba, 0x6b, 0x3d, 0xdc, 0xdf, 0x4c, 0xaf, 0xf9, 0x79, 0x2f, 0x4b, 0xee,
	0x90, 0xf6, 0x5f, 0x1b, 0xa3, 0xdb, 0x64, 0x5d, 0x89, 0x12, 0xba, 0x1f, 0x3f, 0x7f, 0x4a, 0x3c,
	0xe8, 0xc7, 0x64, 0x83, 0xac, 0xbf, 0x9a, 0x56, 0x90, 0xdc, 0x24, 0x9d, 0x4b, 0xfa, 0xb9, 0x30,
	0xa2, 0x1c, 0xbc, 0x5d, 0x9d, 0xf7, 0x65, 0x28, 0x2b, 0x3a, 0x24, 0xb7, 0x56, 0xa8, 0xd1, 0xdd,
	0x7f, 0x32, 0xff, 0xff, 0xc6, 0x62, 0xce, 0xa4, 0x75, 0x52, 0x33, 0xdf, 0x00, 0x6b, 0x62, 0x31,
	0xdf, 0x00, 0x6b, 0x1a, 0x60, 0xe1, 0xc5, 0x14, 0xec, 0xa4, 0x70, 0x8f, 0x5e, 0x9c, 0xce, 0x29,
	0x9a, 0xcd, 0x29, 0x3a, 0x9b, 0x53, 0x74, 0x31, 0xa7, 0xe8, 0x75, 0x4d, 0xf1, 0xfb, 0x9a, 0xa2,
	0xd3, 0x9a, 0xe2, 0x59, 0x4d, 0xf1, 0xb7, 0x9a, 0xe2, 0xef, 0x35, 0x45, 0x17, 0x35, 0xc5, 0xef,
	0x16, 0x14, 0xcd, 0x16, 0x14, 0x9d, 0x2d, 0x28, 0xfa, 0xf1, 0xe5, 0xfc, 0xa4, 0x85, 0xdf, 0x7c,
	0x3d, 0x3f, 0x69, 0x2d, 0xff, 0x5d, 0xa3, 0x0d, 0x7f, 0xb7, 0xf7, 0x7f, 0x06, 0x00, 0x00, 0xff,
	0xff, 0x74, 0xf1, 0x68, 0x83, 0xb2, 0x02, 0x00, 0x00,
}

// Reference imports to suppress errors if they are not otherwise used.
var _ context.Context
var _ grpc.ClientConn

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
const _ = grpc.SupportPackageIsVersion4

// HandleReportNothingServiceClient is the client API for HandleReportNothingService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://godoc.org/google.golang.org/grpc#ClientConn.NewStream.
type HandleReportNothingServiceClient interface {
	// HandleReportNothing is called by Mixer at request-time to deliver 'reportnothing' instances to the backend.
	HandleReportNothing(ctx context.Context, in *HandleReportNothingRequest, opts ...grpc.CallOption) (*v1beta1.ReportResult, error)
}

type handleReportNothingServiceClient struct {
	cc *grpc.ClientConn
}

func NewHandleReportNothingServiceClient(cc *grpc.ClientConn) HandleReportNothingServiceClient {
	return &handleReportNothingServiceClient{cc}
}

func (c *handleReportNothingServiceClient) HandleReportNothing(ctx context.Context, in *HandleReportNothingRequest, opts ...grpc.CallOption) (*v1beta1.ReportResult, error) {
	out := new(v1beta1.ReportResult)
	err := c.cc.Invoke(ctx, "/reportnothing.HandleReportNothingService/HandleReportNothing", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// HandleReportNothingServiceServer is the server API for HandleReportNothingService service.
type HandleReportNothingServiceServer interface {
	// HandleReportNothing is called by Mixer at request-time to deliver 'reportnothing' instances to the backend.
	HandleReportNothing(context.Context, *HandleReportNothingRequest) (*v1beta1.ReportResult, error)
}

// UnimplementedHandleReportNothingServiceServer can be embedded to have forward compatible implementations.
type UnimplementedHandleReportNothingServiceServer struct {
}

func (*UnimplementedHandleReportNothingServiceServer) HandleReportNothing(ctx context.Context, req *HandleReportNothingRequest) (*v1beta1.ReportResult, error) {
	return nil, status.Errorf(codes.Unimplemented, "method HandleReportNothing not implemented")
}

func RegisterHandleReportNothingServiceServer(s *grpc.Server, srv HandleReportNothingServiceServer) {
	s.RegisterService(&_HandleReportNothingService_serviceDesc, srv)
}

func _HandleReportNothingService_HandleReportNothing_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(HandleReportNothingRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(HandleReportNothingServiceServer).HandleReportNothing(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/reportnothing.HandleReportNothingService/HandleReportNothing",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(HandleReportNothingServiceServer).HandleReportNothing(ctx, req.(*HandleReportNothingRequest))
	}
	return interceptor(ctx, in, info, handler)
}

var _HandleReportNothingService_serviceDesc = grpc.ServiceDesc{
	ServiceName: "reportnothing.HandleReportNothingService",
	HandlerType: (*HandleReportNothingServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "HandleReportNothing",
			Handler:    _HandleReportNothingService_HandleReportNothing_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "mixer/template/reportnothing/template_handler_service.proto",
}

func (m *HandleReportNothingRequest) Marshal() (dAtA []byte, err error) {
	size := m.Size()
	dAtA = make([]byte, size)
	n, err := m.MarshalToSizedBuffer(dAtA[:size])
	if err != nil {
		return nil, err
	}
	return dAtA[:n], nil
}

func (m *HandleReportNothingRequest) MarshalTo(dAtA []byte) (int, error) {
	size := m.Size()
	return m.MarshalToSizedBuffer(dAtA[:size])
}

func (m *HandleReportNothingRequest) MarshalToSizedBuffer(dAtA []byte) (int, error) {
	i := len(dAtA)
	_ = i
	var l int
	_ = l
	if len(m.DedupId) > 0 {
		i -= len(m.DedupId)
		copy(dAtA[i:], m.DedupId)
		i = encodeVarintTemplateHandlerService(dAtA, i, uint64(len(m.DedupId)))
		i--
		dAtA[i] = 0x1a
	}
	if m.AdapterConfig != nil {
		{
			size, err := m.AdapterConfig.MarshalToSizedBuffer(dAtA[:i])
			if err != nil {
				return 0, err
			}
			i -= size
			i = encodeVarintTemplateHandlerService(dAtA, i, uint64(size))
		}
		i--
		dAtA[i] = 0x12
	}
	if len(m.Instances) > 0 {
		for iNdEx := len(m.Instances) - 1; iNdEx >= 0; iNdEx-- {
			{
				size, err := m.Instances[iNdEx].MarshalToSizedBuffer(dAtA[:i])
				if err != nil {
					return 0, err
				}
				i -= size
				i = encodeVarintTemplateHandlerService(dAtA, i, uint64(size))
			}
			i--
			dAtA[i] = 0xa
		}
	}
	return len(dAtA) - i, nil
}

func (m *InstanceMsg) Marshal() (dAtA []byte, err error) {
	size := m.Size()
	dAtA = make([]byte, size)
	n, err := m.MarshalToSizedBuffer(dAtA[:size])
	if err != nil {
		return nil, err
	}
	return dAtA[:n], nil
}

func (m *InstanceMsg) MarshalTo(dAtA []byte) (int, error) {
	size := m.Size()
	return m.MarshalToSizedBuffer(dAtA[:size])
}

func (m *InstanceMsg) MarshalToSizedBuffer(dAtA []byte) (int, error) {
	i := len(dAtA)
	_ = i
	var l int
	_ = l
	if len(m.Name) > 0 {
		i -= len(m.Name)
		copy(dAtA[i:], m.Name)
		i = encodeVarintTemplateHandlerService(dAtA, i, uint64(len(m.Name)))
		i--
		dAtA[i] = 0x2
		i--
		dAtA[i] = 0x93
		i--
		dAtA[i] = 0xe4
		i--
		dAtA[i] = 0xd2
		i--
		dAtA[i] = 0xfa
	}
	return len(dAtA) - i, nil
}

func (m *Type) Marshal() (dAtA []byte, err error) {
	size := m.Size()
	dAtA = make([]byte, size)
	n, err := m.MarshalToSizedBuffer(dAtA[:size])
	if err != nil {
		return nil, err
	}
	return dAtA[:n], nil
}

func (m *Type) MarshalTo(dAtA []byte) (int, error) {
	size := m.Size()
	return m.MarshalToSizedBuffer(dAtA[:size])
}

func (m *Type) MarshalToSizedBuffer(dAtA []byte) (int, error) {
	i := len(dAtA)
	_ = i
	var l int
	_ = l
	return len(dAtA) - i, nil
}

func (m *InstanceParam) Marshal() (dAtA []byte, err error) {
	size := m.Size()
	dAtA = make([]byte, size)
	n, err := m.MarshalToSizedBuffer(dAtA[:size])
	if err != nil {
		return nil, err
	}
	return dAtA[:n], nil
}

func (m *InstanceParam) MarshalTo(dAtA []byte) (int, error) {
	size := m.Size()
	return m.MarshalToSizedBuffer(dAtA[:size])
}

func (m *InstanceParam) MarshalToSizedBuffer(dAtA []byte) (int, error) {
	i := len(dAtA)
	_ = i
	var l int
	_ = l
	return len(dAtA) - i, nil
}

func encodeVarintTemplateHandlerService(dAtA []byte, offset int, v uint64) int {
	offset -= sovTemplateHandlerService(v)
	base := offset
	for v >= 1<<7 {
		dAtA[offset] = uint8(v&0x7f | 0x80)
		v >>= 7
		offset++
	}
	dAtA[offset] = uint8(v)
	return base
}
func (m *HandleReportNothingRequest) Size() (n int) {
	if m == nil {
		return 0
	}
	var l int
	_ = l
	if len(m.Instances) > 0 {
		for _, e := range m.Instances {
			l = e.Size()
			n += 1 + l + sovTemplateHandlerService(uint64(l))
		}
	}
	if m.AdapterConfig != nil {
		l = m.AdapterConfig.Size()
		n += 1 + l + sovTemplateHandlerService(uint64(l))
	}
	l = len(m.DedupId)
	if l > 0 {
		n += 1 + l + sovTemplateHandlerService(uint64(l))
	}
	return n
}

func (m *InstanceMsg) Size() (n int) {
	if m == nil {
		return 0
	}
	var l int
	_ = l
	l = len(m.Name)
	if l > 0 {
		n += 5 + l + sovTemplateHandlerService(uint64(l))
	}
	return n
}

func (m *Type) Size() (n int) {
	if m == nil {
		return 0
	}
	var l int
	_ = l
	return n
}

func (m *InstanceParam) Size() (n int) {
	if m == nil {
		return 0
	}
	var l int
	_ = l
	return n
}

func sovTemplateHandlerService(x uint64) (n int) {
	return (math_bits.Len64(x|1) + 6) / 7
}
func sozTemplateHandlerService(x uint64) (n int) {
	return sovTemplateHandlerService(uint64((x << 1) ^ uint64((int64(x) >> 63))))
}
func (this *HandleReportNothingRequest) String() string {
	if this == nil {
		return "nil"
	}
	repeatedStringForInstances := "[]*InstanceMsg{"
	for _, f := range this.Instances {
		repeatedStringForInstances += strings.Replace(f.String(), "InstanceMsg", "InstanceMsg", 1) + ","
	}
	repeatedStringForInstances += "}"
	s := strings.Join([]string{`&HandleReportNothingRequest{`,
		`Instances:` + repeatedStringForInstances + `,`,
		`AdapterConfig:` + strings.Replace(fmt.Sprintf("%v", this.AdapterConfig), "Any", "types.Any", 1) + `,`,
		`DedupId:` + fmt.Sprintf("%v", this.DedupId) + `,`,
		`}`,
	}, "")
	return s
}
func (this *InstanceMsg) String() string {
	if this == nil {
		return "nil"
	}
	s := strings.Join([]string{`&InstanceMsg{`,
		`Name:` + fmt.Sprintf("%v", this.Name) + `,`,
		`}`,
	}, "")
	return s
}
func (this *Type) String() string {
	if this == nil {
		return "nil"
	}
	s := strings.Join([]string{`&Type{`,
		`}`,
	}, "")
	return s
}
func (this *InstanceParam) String() string {
	if this == nil {
		return "nil"
	}
	s := strings.Join([]string{`&InstanceParam{`,
		`}`,
	}, "")
	return s
}
func valueToStringTemplateHandlerService(v interface{}) string {
	rv := reflect.ValueOf(v)
	if rv.IsNil() {
		return "nil"
	}
	pv := reflect.Indirect(rv).Interface()
	return fmt.Sprintf("*%v", pv)
}
func (m *HandleReportNothingRequest) Unmarshal(dAtA []byte) error {
	l := len(dAtA)
	iNdEx := 0
	for iNdEx < l {
		preIndex := iNdEx
		var wire uint64
		for shift := uint(0); ; shift += 7 {
			if shift >= 64 {
				return ErrIntOverflowTemplateHandlerService
			}
			if iNdEx >= l {
				return io.ErrUnexpectedEOF
			}
			b := dAtA[iNdEx]
			iNdEx++
			wire |= uint64(b&0x7F) << shift
			if b < 0x80 {
				break
			}
		}
		fieldNum := int32(wire >> 3)
		wireType := int(wire & 0x7)
		if wireType == 4 {
			return fmt.Errorf("proto: HandleReportNothingRequest: wiretype end group for non-group")
		}
		if fieldNum <= 0 {
			return fmt.Errorf("proto: HandleReportNothingRequest: illegal tag %d (wire type %d)", fieldNum, wire)
		}
		switch fieldNum {
		case 1:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field Instances", wireType)
			}
			var msglen int
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowTemplateHandlerService
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				msglen |= int(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			if msglen < 0 {
				return ErrInvalidLengthTemplateHandlerService
			}
			postIndex := iNdEx + msglen
			if postIndex < 0 {
				return ErrInvalidLengthTemplateHandlerService
			}
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			m.Instances = append(m.Instances, &InstanceMsg{})
			if err := m.Instances[len(m.Instances)-1].Unmarshal(dAtA[iNdEx:postIndex]); err != nil {
				return err
			}
			iNdEx = postIndex
		case 2:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field AdapterConfig", wireType)
			}
			var msglen int
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowTemplateHandlerService
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				msglen |= int(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			if msglen < 0 {
				return ErrInvalidLengthTemplateHandlerService
			}
			postIndex := iNdEx + msglen
			if postIndex < 0 {
				return ErrInvalidLengthTemplateHandlerService
			}
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			if m.AdapterConfig == nil {
				m.AdapterConfig = &types.Any{}
			}
			if err := m.AdapterConfig.Unmarshal(dAtA[iNdEx:postIndex]); err != nil {
				return err
			}
			iNdEx = postIndex
		case 3:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field DedupId", wireType)
			}
			var stringLen uint64
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowTemplateHandlerService
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				stringLen |= uint64(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			intStringLen := int(stringLen)
			if intStringLen < 0 {
				return ErrInvalidLengthTemplateHandlerService
			}
			postIndex := iNdEx + intStringLen
			if postIndex < 0 {
				return ErrInvalidLengthTemplateHandlerService
			}
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			m.DedupId = string(dAtA[iNdEx:postIndex])
			iNdEx = postIndex
		default:
			iNdEx = preIndex
			skippy, err := skipTemplateHandlerService(dAtA[iNdEx:])
			if err != nil {
				return err
			}
			if skippy < 0 {
				return ErrInvalidLengthTemplateHandlerService
			}
			if (iNdEx + skippy) < 0 {
				return ErrInvalidLengthTemplateHandlerService
			}
			if (iNdEx + skippy) > l {
				return io.ErrUnexpectedEOF
			}
			iNdEx += skippy
		}
	}

	if iNdEx > l {
		return io.ErrUnexpectedEOF
	}
	return nil
}
func (m *InstanceMsg) Unmarshal(dAtA []byte) error {
	l := len(dAtA)
	iNdEx := 0
	for iNdEx < l {
		preIndex := iNdEx
		var wire uint64
		for shift := uint(0); ; shift += 7 {
			if shift >= 64 {
				return ErrIntOverflowTemplateHandlerService
			}
			if iNdEx >= l {
				return io.ErrUnexpectedEOF
			}
			b := dAtA[iNdEx]
			iNdEx++
			wire |= uint64(b&0x7F) << shift
			if b < 0x80 {
				break
			}
		}
		fieldNum := int32(wire >> 3)
		wireType := int(wire & 0x7)
		if wireType == 4 {
			return fmt.Errorf("proto: InstanceMsg: wiretype end group for non-group")
		}
		if fieldNum <= 0 {
			return fmt.Errorf("proto: InstanceMsg: illegal tag %d (wire type %d)", fieldNum, wire)
		}
		switch fieldNum {
		case 72295727:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field Name", wireType)
			}
			var stringLen uint64
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowTemplateHandlerService
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				stringLen |= uint64(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			intStringLen := int(stringLen)
			if intStringLen < 0 {
				return ErrInvalidLengthTemplateHandlerService
			}
			postIndex := iNdEx + intStringLen
			if postIndex < 0 {
				return ErrInvalidLengthTemplateHandlerService
			}
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			m.Name = string(dAtA[iNdEx:postIndex])
			iNdEx = postIndex
		default:
			iNdEx = preIndex
			skippy, err := skipTemplateHandlerService(dAtA[iNdEx:])
			if err != nil {
				return err
			}
			if skippy < 0 {
				return ErrInvalidLengthTemplateHandlerService
			}
			if (iNdEx + skippy) < 0 {
				return ErrInvalidLengthTemplateHandlerService
			}
			if (iNdEx + skippy) > l {
				return io.ErrUnexpectedEOF
			}
			iNdEx += skippy
		}
	}

	if iNdEx > l {
		return io.ErrUnexpectedEOF
	}
	return nil
}
func (m *Type) Unmarshal(dAtA []byte) error {
	l := len(dAtA)
	iNdEx := 0
	for iNdEx < l {
		preIndex := iNdEx
		var wire uint64
		for shift := uint(0); ; shift += 7 {
			if shift >= 64 {
				return ErrIntOverflowTemplateHandlerService
			}
			if iNdEx >= l {
				return io.ErrUnexpectedEOF
			}
			b := dAtA[iNdEx]
			iNdEx++
			wire |= uint64(b&0x7F) << shift
			if b < 0x80 {
				break
			}
		}
		fieldNum := int32(wire >> 3)
		wireType := int(wire & 0x7)
		if wireType == 4 {
			return fmt.Errorf("proto: Type: wiretype end group for non-group")
		}
		if fieldNum <= 0 {
			return fmt.Errorf("proto: Type: illegal tag %d (wire type %d)", fieldNum, wire)
		}
		switch fieldNum {
		default:
			iNdEx = preIndex
			skippy, err := skipTemplateHandlerService(dAtA[iNdEx:])
			if err != nil {
				return err
			}
			if skippy < 0 {
				return ErrInvalidLengthTemplateHandlerService
			}
			if (iNdEx + skippy) < 0 {
				return ErrInvalidLengthTemplateHandlerService
			}
			if (iNdEx + skippy) > l {
				return io.ErrUnexpectedEOF
			}
			iNdEx += skippy
		}
	}

	if iNdEx > l {
		return io.ErrUnexpectedEOF
	}
	return nil
}
func (m *InstanceParam) Unmarshal(dAtA []byte) error {
	l := len(dAtA)
	iNdEx := 0
	for iNdEx < l {
		preIndex := iNdEx
		var wire uint64
		for shift := uint(0); ; shift += 7 {
			if shift >= 64 {
				return ErrIntOverflowTemplateHandlerService
			}
			if iNdEx >= l {
				return io.ErrUnexpectedEOF
			}
			b := dAtA[iNdEx]
			iNdEx++
			wire |= uint64(b&0x7F) << shift
			if b < 0x80 {
				break
			}
		}
		fieldNum := int32(wire >> 3)
		wireType := int(wire & 0x7)
		if wireType == 4 {
			return fmt.Errorf("proto: InstanceParam: wiretype end group for non-group")
		}
		if fieldNum <= 0 {
			return fmt.Errorf("proto: InstanceParam: illegal tag %d (wire type %d)", fieldNum, wire)
		}
		switch fieldNum {
		default:
			iNdEx = preIndex
			skippy, err := skipTemplateHandlerService(dAtA[iNdEx:])
			if err != nil {
				return err
			}
			if skippy < 0 {
				return ErrInvalidLengthTemplateHandlerService
			}
			if (iNdEx + skippy) < 0 {
				return ErrInvalidLengthTemplateHandlerService
			}
			if (iNdEx + skippy) > l {
				return io.ErrUnexpectedEOF
			}
			iNdEx += skippy
		}
	}

	if iNdEx > l {
		return io.ErrUnexpectedEOF
	}
	return nil
}
func skipTemplateHandlerService(dAtA []byte) (n int, err error) {
	l := len(dAtA)
	iNdEx := 0
	for iNdEx < l {
		var wire uint64
		for shift := uint(0); ; shift += 7 {
			if shift >= 64 {
				return 0, ErrIntOverflowTemplateHandlerService
			}
			if iNdEx >= l {
				return 0, io.ErrUnexpectedEOF
			}
			b := dAtA[iNdEx]
			iNdEx++
			wire |= (uint64(b) & 0x7F) << shift
			if b < 0x80 {
				break
			}
		}
		wireType := int(wire & 0x7)
		switch wireType {
		case 0:
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return 0, ErrIntOverflowTemplateHandlerService
				}
				if iNdEx >= l {
					return 0, io.ErrUnexpectedEOF
				}
				iNdEx++
				if dAtA[iNdEx-1] < 0x80 {
					break
				}
			}
			return iNdEx, nil
		case 1:
			iNdEx += 8
			return iNdEx, nil
		case 2:
			var length int
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return 0, ErrIntOverflowTemplateHandlerService
				}
				if iNdEx >= l {
					return 0, io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				length |= (int(b) & 0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			if length < 0 {
				return 0, ErrInvalidLengthTemplateHandlerService
			}
			iNdEx += length
			if iNdEx < 0 {
				return 0, ErrInvalidLengthTemplateHandlerService
			}
			return iNdEx, nil
		case 3:
			for {
				var innerWire uint64
				var start int = iNdEx
				for shift := uint(0); ; shift += 7 {
					if shift >= 64 {
						return 0, ErrIntOverflowTemplateHandlerService
					}
					if iNdEx >= l {
						return 0, io.ErrUnexpectedEOF
					}
					b := dAtA[iNdEx]
					iNdEx++
					innerWire |= (uint64(b) & 0x7F) << shift
					if b < 0x80 {
						break
					}
				}
				innerWireType := int(innerWire & 0x7)
				if innerWireType == 4 {
					break
				}
				next, err := skipTemplateHandlerService(dAtA[start:])
				if err != nil {
					return 0, err
				}
				iNdEx = start + next
				if iNdEx < 0 {
					return 0, ErrInvalidLengthTemplateHandlerService
				}
			}
			return iNdEx, nil
		case 4:
			return iNdEx, nil
		case 5:
			iNdEx += 4
			return iNdEx, nil
		default:
			return 0, fmt.Errorf("proto: illegal wireType %d", wireType)
		}
	}
	panic("unreachable")
}

var (
	ErrInvalidLengthTemplateHandlerService = fmt.Errorf("proto: negative length found during unmarshaling")
	ErrIntOverflowTemplateHandlerService   = fmt.Errorf("proto: integer overflow")
)